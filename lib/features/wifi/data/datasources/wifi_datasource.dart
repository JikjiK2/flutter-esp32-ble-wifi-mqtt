import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/infrastructure/mdns_service.dart';
import 'package:flutter_esp32_ble_wifi/core/infrastructure/wifi/wifi_client.dart';
import 'package:flutter_esp32_ble_wifi/core/infrastructure/wifi/wifi_client_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_config_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_network_entity.dart';

part 'wifi_datasource.g.dart';

abstract class WifiDataSource {
  Future<List<WifiNetwork>> scanNearbyDevices();

  Future<bool> connectToDevice(String ssid);

  Future<void> disconnectFromDevice();

  Future<void> setForceWifiUsage(bool use);

  Future<void> postWifiCredentials(WifiConfig config);

  Future<List<WifiNetwork>> getAvailableNetworks();

  Future<String?> checkWifiStatus();

  Future<void> resetDevice(String host);

  Future<void> connectControl(String host);

  Future<void> disconnectControl();

  Future<void> sendCommand(LampStatus status);

  Future<String> discoverDevice(String deviceId);

  Stream<LampStatus> get statusStream;

  Stream<String> get rawLogStream;

  void dispose();
}

@Riverpod(keepAlive: true)
WifiDataSource wifiDataSourceImpl(Ref ref) {
  final client = ref.watch(wifiClientProvider);
  final mdns = ref.watch(mdnsServiceProvider);
  final ds = WifiDataSourceImpl(client, mdns);
  ref.onDispose(() => ds.dispose());
  return ds;
}

class WifiDataSourceImpl implements WifiDataSource {
  final WifiClient _wifiClient;
  final MdnsService _mdnsService;
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
    ),
  );

  WebSocketChannel? _channel;
  final _statusController = StreamController<LampStatus>.broadcast();
  final _rawLogController = StreamController<String>.broadcast();
  StreamSubscription? _subscription;

  WifiDataSourceImpl(this._wifiClient, this._mdnsService);

  @override
  Stream<LampStatus> get statusStream => _statusController.stream;

  @override
  Stream<String> get rawLogStream => _rawLogController.stream;

  @override
  void dispose() {
    disconnectControl();
    _statusController.close();
    _rawLogController.close();
  }

  @override
  Future<String> discoverDevice(String deviceId) async {
    return await _mdnsService.resolveService(deviceId);
  }

  @override
  Future<List<WifiNetwork>> scanNearbyDevices() async {
    try {
      final results = await _wifiClient.scanNetworks();
      return results
          .map(
            (e) =>
                WifiNetwork(ssid: e.ssid, rssi: e.rssi, isSecure: e.isSecure),
          )
          .toList();
    } catch (e) {
      AppLogger.e("WiFi Scan Error: $e", tag: 'WIFI-DS');
      rethrow;
    }
  }

  @override
  Future<bool> connectToDevice(String ssid) async =>
      await _wifiClient.connect(ssid);

  @override
  Future<void> disconnectFromDevice() async => await _wifiClient.disconnect();

  @override
  Future<void> setForceWifiUsage(bool use) async =>
      await _wifiClient.setForceWifiUsage(use);

  @override
  Future<void> postWifiCredentials(WifiConfig config) async {
    final Map<String, dynamic> data = {
      "ssid": config.ssid,
      "password": config.password,
      "device_id": config.deviceId,
    };
    try {
      final payload = jsonEncode(data);
      _rawLogController.add("TX: Setup info: $payload");
      await _dio.post(
        "${AppConstants.deviceSetupBaseUrl}/setup",
        data: data,
        options: Options(contentType: "application/json"),
      );
    } catch (e) {
      _rawLogController.add("ERROR: Setup post failed: $e");
      rethrow;
    }
  }

  @override
  Future<String?> checkWifiStatus() async {
    try {
      final response = await _dio.get(
        "${AppConstants.deviceSetupBaseUrl}/wifi_status",
      );
      if (response.data["connected"] == true && response.data["ip"] != null) {
        return response.data["ip"];
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<WifiNetwork>> getAvailableNetworks() async {
    try {
      final response = await _dio.get(
        "${AppConstants.deviceSetupBaseUrl}/scan",
      );
      if (response.data is List) {
        return (response.data as List)
            .map(
              (json) => WifiNetwork(
                ssid: json['ssid'] ?? 'Unknown',
                rssi: (json['rssi'] as num?)?.toInt() ?? -100,
                isSecure: json['secure'] ?? true,
              ),
            )
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> connectControl(String host) async {
    await disconnectControl();
    String cleanHost = host
        .replaceAll("http://", "")
        .replaceAll("ws://", "")
        .split('/')
        .first;
    final wsUrl = "ws://$cleanHost:81/";

    try {
      _rawLogController.add("TX: Connecting WS to $wsUrl");
      final WebSocket socket = await WebSocket.connect(
        wsUrl,
      ).timeout(const Duration(seconds: 5));
      _channel = IOWebSocketChannel(socket);
      _rawLogController.add("INFO: Connected to WebSocket: $wsUrl");

      _subscription = _channel!.stream.listen(
        (message) {
          final String rawStr = message.toString();
          _rawLogController.add("RX: $rawStr");
          try {
            final dynamic data = jsonDecode(rawStr);
            if (data is Map<String, dynamic>) {
              _statusController.add(
                LampStatus(
                  deviceId: cleanHost,
                  color:
                      (data['r'].toInt() << 16 |
                      data['g'].toInt() << 8 |
                      data['b'].toInt()),
                  brightness: (data['brightness'] as num?)?.toInt() ?? 0,
                  isOn: data['isOn'] == true,
                  ledMode: (data['ledMode'] as num?)?.toInt() ?? 0,
                  brightMode: (data['brightMode'] as num?)?.toInt() ?? 0,
                  temperature: (data['temp'] as num?)?.toDouble() ?? 0.0,
                  humidity: (data['hum'] as num?)?.toDouble() ?? 0.0,
                  rssi: (data['rssi'] as num?)?.toInt() ?? -100,
                  timestamp: DateTime.now(),
                ),
              );
            }
          } catch (e) {
            _rawLogController.add("ERROR: WS parse failed: $e");
          }
        },
        onDone: () {
          _rawLogController.add("INFO: WebSocket closed");
          disconnectControl();
        },
        onError: (e) {
          _rawLogController.add("ERROR: WebSocket error: $e");
          disconnectControl();
        },
      );
    } catch (e) {
      _rawLogController.add("ERROR: WS connection failed: $e");
      rethrow;
    }
  }

  @override
  Future<void> disconnectControl() async {
    await _subscription?.cancel();
    await _channel?.sink.close();
    _subscription = null;
    _channel = null;
  }

  @override
  Future<void> sendCommand(LampStatus status) async {
    if (_channel == null) return;
    final payload = {
      "isOn": status.isOn,
      "brightness": status.brightness.clamp(0, 255),
      "r": (status.color >> 16) & 0xFF,
      "g": (status.color >> 8) & 0xFF,
      "b": status.color & 0xFF,
      "ledMode": status.ledMode,
      "brightMode": status.brightMode,
    };
    final jsonStr = jsonEncode(payload);
    _channel!.sink.add(jsonStr);
    _rawLogController.add("TX: $jsonStr");
  }

  @override
  Future<void> resetDevice(String host) async {
    try {
      _rawLogController.add("TX: Reset command to $host");
      await _dio.post("http://$host/reset");
    } catch (e) {
      _rawLogController.add("ERROR: Reset failed: $e");
      rethrow;
    }
  }
}
