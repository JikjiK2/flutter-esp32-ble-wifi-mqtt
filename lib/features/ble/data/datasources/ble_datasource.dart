import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/models/ble_device_model.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';

part 'ble_datasource.g.dart';

@Riverpod(keepAlive: true)
BleDataSource bleDataSource(Ref ref) {
  final ds = BleDataSourceImpl();
  ref.onDispose(() => ds.dispose());
  return ds;
}

abstract class BleDataSource {
  Stream<BleAdapterState> get adapterState;

  Stream<bool> get isScanning;

  Stream<List<BleDevice>> scanDevices();

  Future<void> startDeviceScan();

  Future<void> stopDeviceScan();

  Future<void> connectDevice(String macId);

  Future<void> disconnectDevice();

  Future<void> sendLampStatus(String macId, LampStatus status);

  Stream<LampStatus> statusStream(String macId);

  Stream<String> get rawLogStream;

  Stream<BleDeviceConnectionState> deviceStateStream(String macId);

  Future<void> turnOnBlueTooth();

  Future<int> readRssi(String macId);

  void dispose();
}

class BleDataSourceImpl implements BleDataSource {
  BluetoothCharacteristic? _rxCharacteristic;
  BluetoothCharacteristic? _txCharacteristic;
  BluetoothDevice? _connectedDevice;

  final _responseController = StreamController<LampStatus>.broadcast();
  final _rawLogController = StreamController<String>.broadcast();
  StreamSubscription? _lastValueSubscription;

  @override
  void dispose() {
    _lastValueSubscription?.cancel();
    _responseController.close();
    _rawLogController.close();
  }

  @override
  Stream<BleAdapterState> get adapterState async* {
    yield _convertAdapterState(FlutterBluePlus.adapterStateNow);
    yield* FlutterBluePlus.adapterState.map(_convertAdapterState);
  }

  BleAdapterState _convertAdapterState(BluetoothAdapterState s) {
    switch (s) {
      case BluetoothAdapterState.on:
        return BleAdapterState.on;
      case BluetoothAdapterState.off:
        return BleAdapterState.off;
      case BluetoothAdapterState.unauthorized:
        return BleAdapterState.unauthorized;
      default:
        return BleAdapterState.unknown;
    }
  }

  @override
  Stream<bool> get isScanning => FlutterBluePlus.isScanning;

  @override
  Future<void> startDeviceScan() async {
    try {
      if (FlutterBluePlus.adapterStateNow != BluetoothAdapterState.on) {
        throw const AppException.business("블루투스가 꺼져 있습니다.");
      }
      if (FlutterBluePlus.isScanningNow) await FlutterBluePlus.stopScan();
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 15),
        androidUsesFineLocation: true,
      );
    } catch (e) {
      AppLogger.e("Scan Start Error: $e", tag: 'BLE-DS');
      rethrow;
    }
  }

  @override
  Future<void> stopDeviceScan() => FlutterBluePlus.stopScan();

  @override
  Stream<List<BleDevice>> scanDevices() {
    return FlutterBluePlus.scanResults.map((results) {
      return results
          .where(
            (r) => r.advertisementData.advName.toLowerCase().contains("esp32"),
          )
          .map((r) => BleDeviceModel.fromScanResult(r).toEntity())
          .toList();
    });
  }

  @override
  Future<void> connectDevice(String macId) async {
    final device = BluetoothDevice.fromId(macId);
    _connectedDevice = device;

    try {
      await device.connect(
        timeout: const Duration(seconds: 10),
        autoConnect: false,
        license: License.free,
      );

      if (Platform.isAndroid) {
        await device.requestMtu(512);
        await Future.delayed(const Duration(milliseconds: 500));
      }

      final services = await device.discoverServices();
      for (var s in services) {
        if (s.uuid.toString().toLowerCase() ==
            AppConstants.bleServiceUuid.toLowerCase()) {
          for (var c in s.characteristics) {
            final uuid = c.uuid.toString().toLowerCase();
            if (uuid == AppConstants.bleCharUuidRx.toLowerCase()) {
              _rxCharacteristic = c;
            }
            if (uuid == AppConstants.bleCharUuidTx.toLowerCase()) {
              _txCharacteristic = c;
              await _txCharacteristic!.setNotifyValue(true);
              _lastValueSubscription?.cancel();
              _lastValueSubscription = _txCharacteristic!.lastValueStream
                  .listen(_parseIncomingData);
            }
          }
        }
      }

      if (_rxCharacteristic == null || _txCharacteristic == null) {
        throw const AppException.business("필요한 BLE 서비스를 찾을 수 없습니다.");
      }

      await _rxCharacteristic!.write(
        utf8.encode('{"cmd":"get_status"}'),
        withoutResponse: false,
      );
    } catch (e) {
      AppLogger.e("Connect Error: $e", tag: 'BLE-DS');
      await disconnectDevice();
      rethrow;
    }
  }

  void _parseIncomingData(List<int> value) {
    if (value.isEmpty) return;
    try {
      final rawStr = utf8.decode(value).trim();
      _rawLogController.add("RX: $rawStr");

      final dynamic data = jsonDecode(rawStr);
      if (data is Map<String, dynamic>) {
        final int rawBrightness = (data['brightness'] as num?)?.toInt() ?? 0;
        final int normalizedBrightness = (rawBrightness).clamp(0, 255);

        _responseController.add(
          LampStatus(
            deviceId: _connectedDevice?.remoteId.str ?? "N/A",
            isOn: data['isOn'] ?? true,
            brightness: normalizedBrightness,
            color: (data['r'] != null && data['g'] != null && data['b'] != null)
                ? (data['r'].toInt() << 16 |
                      data['g'].toInt() << 8 |
                      data['b'].toInt())
                : 0xFFFFFF,
            ledMode: data['ledMode']?.toInt() ?? 0,
            brightMode: data['brightMode']?.toInt() ?? 0,
            temperature: (data['temp'] as num?)?.toDouble() ?? 0.0,
            humidity: (data['hum'] as num?)?.toDouble() ?? 0.0,
            timestamp: DateTime.now(),
          ),
        );
      }
    } catch (_) {}
  }

  @override
  Future<void> disconnectDevice() async {
    _lastValueSubscription?.cancel();
    _rxCharacteristic = null;
    _txCharacteristic = null;
    if (_connectedDevice != null) {
      await _connectedDevice!.disconnect();
    }
    _connectedDevice = null;
  }

  @override
  Future<void> sendLampStatus(String macId, LampStatus status) async {
    if (_rxCharacteristic == null) {
      throw const AppException.business("기기가 연결되어 있지 않습니다.");
    }

    final payload = {
      "isOn": status.isOn,
      "ledMode": status.ledMode,
      "r": (status.color >> 16) & 0xFF,
      "g": (status.color >> 8) & 0xFF,
      "b": status.color & 0xFF,
      "brightness": status.brightness.clamp(0, 255),
      "brightMode": status.brightMode,
    };

    final jsonStr = jsonEncode(payload);
    _rawLogController.add("TX: $jsonStr");

    try {
      await _rxCharacteristic!.write(
        utf8.encode(jsonStr),
        withoutResponse: false,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<LampStatus> statusStream(String macId) => _responseController.stream;

  @override
  Stream<String> get rawLogStream => _rawLogController.stream;

  @override
  Stream<BleDeviceConnectionState> deviceStateStream(String macId) {
    return BluetoothDevice.fromId(macId).connectionState.map((s) {
      return s == BluetoothConnectionState.connected
          ? BleDeviceConnectionState.connected
          : BleDeviceConnectionState.disconnected;
    });
  }

  @override
  Future<void> turnOnBlueTooth() async {
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
  }

  @override
  Future<int> readRssi(String macId) async {
    try {
      return await BluetoothDevice.fromId(macId).readRssi();
    } catch (_) {
      return -100;
    }
  }
}
