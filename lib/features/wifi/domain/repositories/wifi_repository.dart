import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_config_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_network_entity.dart';

abstract class WifiRepository {
  Future<Result<String>> discoverDevice(String deviceId);

  Future<Result<List<WifiNetwork>>> scanNearbyDevices();

  Future<Result<bool>> connectToDevice(String ssid);

  Future<void> disconnectFromDevice();

  Future<void> setForceWifiUsage(bool use);

  Future<Result<List<WifiNetwork>>> getAvailableNetworks();

  Future<Result<void>> sendWifiCredentials(WifiConfig config);

  Future<Result<String?>> checkWifiStatus();

  Future<Result<void>> resetDevice(String host);

  Future<Result<void>> connectControl(String host);

  Future<Result<void>> disconnectControl();

  Future<Result<void>> sendCommand(LampStatus status, {String? description});

  Stream<LampStatus> get statusStream;

  Stream<String> get rawLogStream;
}
