import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';

abstract class MqttRepository {
  Future<Result<List<MqttSetupNetwork>>> scanNearbyDevices();

  Future<Result<bool>> connectToDevice(String ssid);

  Future<void> disconnectFromDevice();

  Future<void> setForceWifiUsage(bool use);

  Future<Result<void>> verifyWifi({
    required String ssid,
    required String password,
  });

  Future<Result<void>> verifyMqtt({required String brokerIp});

  Future<Result<Map<String, dynamic>>> checkMqttStatus();

  Future<Result<void>> finalizeSetup();

  Future<Result<String?>> checkWifiStatus();

  Future<Result<List<MqttSetupNetwork>>> getAvailableNetworks();

  Future<Result<void>> connect(
    String host,
    int port, {
    String? username,
    String? password,
  });

  Future<Result<void>> disconnect();

  Stream<Map<String, LampStatus>> get multiDeviceStatusStream;

  Stream<ConnectionStatus> get connectionStatusStream;

  Stream<String> get rawLogStream;

  Future<Result<void>> sendCommand(
    String deviceId,
    LampStatus status, {
    String? description,
  });

  Future<Result<void>> publishRaw(String topic, String jsonPayload);

  Future<Result<void>> reconfigureDevice({
    required String deviceId,
    required Map<String, dynamic> config,
  });

  Future<Result<void>> resetDevice(String deviceId);

  Future<Result<void>> sendMqttConfig({
    required String ssid,
    required String password,
    required String brokerIp,
    required String deviceId,
    required String ownerEmail,
  });
}
