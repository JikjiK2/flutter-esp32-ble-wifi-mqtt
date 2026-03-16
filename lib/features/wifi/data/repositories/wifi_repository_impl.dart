import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/data/datasources/wifi_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_config_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_network_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/repositories/wifi_repository.dart';

part 'wifi_repository_impl.g.dart';

@Riverpod(keepAlive: true)
WifiRepository wifiRepositoryImpl(Ref ref) {
  final dataSource = ref.watch(wifiDataSourceImplProvider);
  return WifiRepositoryImpl(dataSource);
}

class WifiRepositoryImpl implements WifiRepository {
  final WifiDataSource _dataSource;

  WifiRepositoryImpl(this._dataSource);

  @override
  Stream<String> get rawLogStream => _dataSource.rawLogStream;

  @override
  Future<Result<String>> discoverDevice(String deviceId) async {
    AppLogger.d("Discovering device: $deviceId", tag: 'WIFI-REPO');
    return await Result.guard(() => _dataSource.discoverDevice(deviceId));
  }

  @override
  Stream<LampStatus> get statusStream => _dataSource.statusStream;

  @override
  Future<Result<List<WifiNetwork>>> scanNearbyDevices() async {
    return await Result.guard(() async {
      final networks = await _dataSource.scanNearbyDevices();
      return networks.where((n) => n.ssid.contains("esp32_")).toList();
    });
  }

  @override
  Future<Result<bool>> connectToDevice(String ssid) async =>
      await Result.guard(() => _dataSource.connectToDevice(ssid));

  @override
  Future<void> disconnectFromDevice() async =>
      await _dataSource.disconnectFromDevice();

  @override
  Future<void> setForceWifiUsage(bool use) async =>
      await _dataSource.setForceWifiUsage(use);

  @override
  Future<Result<List<WifiNetwork>>> getAvailableNetworks() async =>
      await Result.guard(() => _dataSource.getAvailableNetworks());

  @override
  Future<Result<void>> sendWifiCredentials(WifiConfig config) async =>
      await Result.guard(() => _dataSource.postWifiCredentials(config));

  @override
  Future<Result<String?>> checkWifiStatus() async =>
      await Result.guard(() => _dataSource.checkWifiStatus());

  @override
  Future<Result<void>> resetDevice(String host) async {
    return await Result.guard(() => _dataSource.resetDevice(host));
  }

  @override
  Future<Result<void>> connectControl(String host) async =>
      await Result.guard(() => _dataSource.connectControl(host));

  @override
  Future<Result<void>> disconnectControl() async =>
      await Result.guard(() => _dataSource.disconnectControl());

  @override
  Future<Result<void>> sendCommand(
    LampStatus status, {
    String? description,
  }) async {
    return await Result.guard(() => _dataSource.sendCommand(status));
  }
}
