import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/data/models/mqtt_lamp_status_model.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_topics.dart';

part 'mqtt_datasource.g.dart';

abstract class MqttDataSource {
  Future<void> postMqttConfig(
    String ssid,
    String password,
    String brokerIp,
    String deviceId,
    String ownerEmail,
  );

  Future<void> postWifiLocalConfig(String ssid, String password);

  Future<void> updateBrokerAddress(String deviceIp, String brokerIp);

  Future<void> publishReconfigure(String deviceId, Map<String, dynamic> config);

  Future<void> verifyWifi(String ssid, String password);

  Future<void> verifyMqtt(String brokerIp);

  Future<void> finalizeSetup();

  Future<String?> checkWifiStatus();

  Future<Map<String, dynamic>> checkMqttStatus();

  Future<List<MqttSetupNetwork>> getAvailableNetworks();

  Stream<Map<String, LampStatus>> get multiDeviceStatusStream;

  Stream<ConnectionStatus> get connectionStatusStream;

  Stream<String> get rawLogStream;

  Future<void> connect(
    String host,
    int port,
    String clientId, {
    String? username,
    String? password,
  });

  Future<void> disconnect();

  Future<void> publishCommand(String deviceId, LampStatus status);

  Future<void> publishRaw(String topic, String payload);

  Future<void> resetDevice(String deviceId);

  void dispose();
}

@Riverpod(keepAlive: true)
MqttDataSource mqttDataSource(Ref ref) {
  final ds = MqttDataSourceImpl();
  ref.onDispose(() => ds.dispose());
  return ds;
}

class MqttDataSourceImpl implements MqttDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: AppConstants.deviceHttpTimeoutMedium,
      receiveTimeout: AppConstants.deviceHttpTimeoutMedium,
      validateStatus: (status) => status! < 500,
    ),
  );

  MqttServerClient? _client;
  final _statusController =
      StreamController<Map<String, LampStatus>>.broadcast();
  final _connectionController = StreamController<ConnectionStatus>.broadcast();
  final _rawLogController = StreamController<String>.broadcast();
  final Map<String, LampStatus> _deviceStates = {};
  StreamSubscription? _updatesSubscription;

  @override
  Stream<Map<String, LampStatus>> get multiDeviceStatusStream =>
      _statusController.stream;

  @override
  Stream<ConnectionStatus> get connectionStatusStream =>
      _connectionController.stream;

  @override
  Stream<String> get rawLogStream => _rawLogController.stream;

  @override
  void dispose() {
    disconnect();
    _statusController.close();
    _connectionController.close();
    _rawLogController.close();
  }

  @override
  Future<void> verifyWifi(String ssid, String password) async {
    await _dio.post(
      "${AppConstants.deviceSetupBaseUrl}/setup",
      data: {"ssid": ssid, "password": password},
    );
  }

  @override
  Future<void> verifyMqtt(String brokerIp) async {
    await _dio.post(
      "${AppConstants.deviceSetupBaseUrl}/setup",
      data: {"mqtt_broker": brokerIp},
    );
  }

  @override
  Future<void> finalizeSetup() async {
    try {
      await _dio
          .post(
            "${AppConstants.deviceSetupBaseUrl}/setup",
            data: {"cmd": "complete"},
          )
          .timeout(AppConstants.deviceHttpTimeoutShort);
    } catch (_) {}
  }

  @override
  Future<void> postMqttConfig(
    String ssid,
    String password,
    String brokerIp,
    String deviceId,
    String ownerEmail,
  ) async {
    int retry = 0;
    while (retry < AppConstants.deviceHttpRetryCount) {
      try {
        await _dio
            .post(
              "${AppConstants.deviceSetupBaseUrl}/setup",
              data: {
                "ssid": ssid,
                "password": password,
                "mqtt_broker": brokerIp,
                "device_id": deviceId,
                "owner_email": ownerEmail,
              },
            )
            .timeout(AppConstants.deviceHttpTimeoutMedium);
        return;
      } catch (e) {
        retry++;
        if (retry >= AppConstants.deviceHttpRetryCount) rethrow;
        await Future.delayed(AppConstants.deviceHttpRetryDelay);
      }
    }
  }

  @override
  Future<void> postWifiLocalConfig(String ssid, String password) async {
    await _dio.post(
      "${AppConstants.deviceSetupBaseUrl}/setup",
      data: {"ssid": ssid, "password": password},
    );
  }

  @override
  Future<void> updateBrokerAddress(String deviceIp, String brokerIp) async {
    await _dio.post("http://$deviceIp/setup", data: {"mqtt_broker": brokerIp});
  }

  @override
  Future<void> publishReconfigure(
    String deviceId,
    Map<String, dynamic> config,
  ) async {
    if (_client?.connectionStatus?.state != MqttConnectionState.connected) {
      return;
    }
    final String topic = MqttTopics.deviceControl(deviceId);
    final builder = MqttClientPayloadBuilder();
    final payload = jsonEncode(config);
    builder.addString(payload);
    _client!.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
    _rawLogController.add("TX: $payload");
  }

  @override
  Future<String?> checkWifiStatus() async {
    try {
      final response = await _dio
          .get("${AppConstants.deviceSetupBaseUrl}/wifi_status")
          .timeout(AppConstants.deviceHttpTimeoutShort);
      if (response.data["connected"] == true && response.data["ip"] != null) {
        return response.data["ip"];
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>> checkMqttStatus() async {
    final response = await _dio
        .get("${AppConstants.deviceSetupBaseUrl}/mqtt_status")
        .timeout(
          AppConstants.deviceHttpTimeoutShort + const Duration(seconds: 1),
        );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<List<MqttSetupNetwork>> getAvailableNetworks() async {
    try {
      final response = await _dio
          .get("${AppConstants.deviceSetupBaseUrl}/scan")
          .timeout(AppConstants.deviceHttpTimeoutLong);
      if (response.data is List) {
        return (response.data as List)
            .map(
              (json) => MqttSetupNetwork(
                ssid: json['ssid'] ?? 'Unknown',
                rssi: json['rssi'] ?? -100,
                isSecure: json['secure'] ?? true,
              ),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> connect(
    String host,
    int port,
    String clientId, {
    String? username,
    String? password,
  }) async {
    if (_client?.connectionStatus?.state == MqttConnectionState.connecting) {
      return;
    }

    if (_client?.connectionStatus?.state == MqttConnectionState.connected &&
        _client?.server == host) {
      return;
    }

    await disconnect();

    final cleanHost = host
        .replaceAll('http://', '')
        .replaceAll('https://', '')
        .split(':')
        .first;

    _client = MqttServerClient(cleanHost, clientId);
    _client!.port = port;

    if (port == 8883) {
      _client!.secure = true;
      _client!.onBadCertificate = (dynamic cert) => true;
    }

    _client!.keepAlivePeriod = AppConstants.mqttKeepAlivePeriod;
    _client!.connectTimeoutPeriod =
        AppConstants.mqttConnectTimeout.inMilliseconds;
    _client!.logging(on: false);

    _client!.onDisconnected = () {
      _updateStatus(ConnectionStatus.disconnected);
    };

    _client!.onConnected = () {
      _updateStatus(ConnectionStatus.connected);
      _setupMessageListener();
      _client?.subscribe(MqttTopics.allStatus, MqttQos.atLeastOnce);
    };

    _client!.setProtocolV311();
    _client!.autoReconnect = true;

    try {
      _updateStatus(ConnectionStatus.connecting);
      await _client!.connect(username, password);
    } catch (e) {
      _updateStatus(ConnectionStatus.error);
      _client?.disconnect();
    }
  }

  @override
  Future<void> disconnect() async {
    await _updatesSubscription?.cancel();
    _updatesSubscription = null;
    _client?.disconnect();
    _client = null;
    _updateStatus(ConnectionStatus.disconnected);
  }

  void _setupMessageListener() {
    _updatesSubscription?.cancel();
    _updatesSubscription = _client?.updates?.listen((
      List<MqttReceivedMessage<MqttMessage>> c,
    ) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final pt = MqttPublishPayload.bytesToStringAsString(
        recMess.payload.message,
      );
      _rawLogController.add("RX: $pt");

      try {
        final Map<String, dynamic> data = jsonDecode(pt);
        final model = MqttLampStatusModel.fromJson(data);
        final String? deviceId = MqttTopics.extractDeviceId(c[0].topic);
        if (deviceId != null) {
          _deviceStates[deviceId] = model.toEntity(deviceId);
          _statusController.add(Map.from(_deviceStates));
        }
      } catch (_) {}
    });
  }

  @override
  Future<void> publishCommand(String deviceId, LampStatus status) async {
    if (_client?.connectionStatus?.state != MqttConnectionState.connected) {
      return;
    }
    final Map<String, dynamic> commandData = {
      "isOn": status.isOn,
      "brightness": status.brightness,
      "r": (status.color >> 16) & 0xFF,
      "g": (status.color >> 8) & 0xFF,
      "b": status.color & 0xFF,
      "ledMode": status.ledMode,
      "brightMode": status.brightMode,
    };
    final String topic = MqttTopics.deviceControl(deviceId);
    final builder = MqttClientPayloadBuilder();
    final payload = jsonEncode(commandData);
    builder.addString(payload);
    _client!.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
    _rawLogController.add("TX: $payload");
  }

  @override
  Future<void> publishRaw(String topic, String payload) async {
    if (_client?.connectionStatus?.state != MqttConnectionState.connected) {
      return;
    }
    final builder = MqttClientPayloadBuilder();
    builder.addString(payload);
    _client!.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
    _rawLogController.add("TX: $payload");
  }

  @override
  Future<void> resetDevice(String deviceId) async {
    if (_client?.connectionStatus?.state != MqttConnectionState.connected) {
      return;
    }
    final String topic = MqttTopics.deviceControl(deviceId);
    final builder = MqttClientPayloadBuilder();
    final payload = jsonEncode({"cmd": "reset"});
    builder.addString(payload);
    _client!.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
    _rawLogController.add("TX: $payload");
  }

  void _updateStatus(ConnectionStatus status) {
    if (!_connectionController.isClosed) _connectionController.add(status);
  }
}
