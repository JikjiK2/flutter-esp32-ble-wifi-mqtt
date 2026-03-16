import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';

abstract class BleRepository {
  Stream<BleAdapterState> get adapterState;

  Stream<bool> get isScanning;

  Stream<List<BleDevice>> scanDevices();

  Future<void> startDeviceScan();

  Future<Result<void>> stopDeviceScan();

  Future<Result<void>> connectDevice(String macId);

  Future<Result<void>> disconnectDevice();

  Future<Result<void>> sendLampStatus(
    String macId,
    LampStatus status, {
    String? description,
  });

  Stream<LampStatus> statusStream(String macId);

  Stream<String> get rawLogStream;

  Stream<BleDeviceConnectionState> deviceStateStream(String macId);

  Future<Result<void>> turnOnBlueTooth();

  Future<Result<int>> readRssi(String macId);
}
