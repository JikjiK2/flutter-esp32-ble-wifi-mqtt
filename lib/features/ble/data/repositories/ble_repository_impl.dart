import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/datasources/ble_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_repository.dart';

part 'ble_repository_impl.g.dart';

@Riverpod(keepAlive: true)
BleRepository bleRepositoryImpl(Ref ref) {
  final dataSource = ref.watch(bleDataSourceProvider);
  final repo = BleRepositoryImpl(dataSource);
  return repo;
}

class BleRepositoryImpl implements BleRepository {
  final BleDataSource _dataSource;

  BleRepositoryImpl(this._dataSource);

  @override
  Stream<BleAdapterState> get adapterState => _dataSource.adapterState;

  @override
  Stream<bool> get isScanning => _dataSource.isScanning;

  @override
  Stream<List<BleDevice>> scanDevices() => _dataSource.scanDevices();

  @override
  Future<void> startDeviceScan() => _dataSource.startDeviceScan();

  @override
  Future<Result<void>> stopDeviceScan() async {
    return await Result.guard(() => _dataSource.stopDeviceScan());
  }

  @override
  Future<Result<void>> connectDevice(String macId) async {
    return await Result.guard(() => _dataSource.connectDevice(macId));
  }

  @override
  Future<Result<void>> disconnectDevice() async {
    return await Result.guard(() => _dataSource.disconnectDevice());
  }

  @override
  Future<Result<void>> sendLampStatus(
    String macId,
    LampStatus status, {
    String? description,
  }) async {
    if (description != null) {
      AppLogger.d("BLE Action: $description", tag: 'BLE-REPO');
    }
    return await Result.guard(() => _dataSource.sendLampStatus(macId, status));
  }

  @override
  Stream<LampStatus> statusStream(String macId) =>
      _dataSource.statusStream(macId);

  @override
  Stream<BleDeviceConnectionState> deviceStateStream(String macId) =>
      _dataSource.deviceStateStream(macId);

  @override
  Future<Result<void>> turnOnBlueTooth() async {
    return await Result.guard(() => _dataSource.turnOnBlueTooth());
  }

  @override
  Future<Result<int>> readRssi(String macId) async {
    return await Result.guard(() => _dataSource.readRssi(macId));
  }

  @override
  Stream<String> get rawLogStream => _dataSource.rawLogStream;

  void dispose() {
    _dataSource.dispose();
  }
}
