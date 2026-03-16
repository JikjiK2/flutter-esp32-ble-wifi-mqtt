import 'dart:math';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/data/datasources/mqtt_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/data/datasources/wifi_native_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/repositories/mqtt_repository.dart';

part 'mqtt_repository_impl.g.dart';

@Riverpod(keepAlive: true)
MqttRepository mqttRepositoryImpl(Ref ref) {
  final mqttDataSource = ref.watch(mqttDataSourceProvider);
  final wifiDataSource = ref.watch(wifiNativeDataSourceProvider);
  return MqttRepositoryImpl(
    mqttDataSource: mqttDataSource,
    wifiDataSource: wifiDataSource,
  );
}

class MqttRepositoryImpl implements MqttRepository {
  final MqttDataSource _mqttDataSource;
  final WifiNativeDataSource _wifiDataSource;

  MqttRepositoryImpl({
    required MqttDataSource mqttDataSource,
    required WifiNativeDataSource wifiDataSource,
  }) : _mqttDataSource = mqttDataSource,
       _wifiDataSource = wifiDataSource;

  @override
  Stream<String> get rawLogStream => _mqttDataSource.rawLogStream;

  @override
  Future<Result<void>> verifyWifi({
    required String ssid,
    required String password,
  }) async {
    return await Result.guard(() => _mqttDataSource.verifyWifi(ssid, password));
  }

  @override
  Future<Result<void>> verifyMqtt({required String brokerIp}) async {
    return await Result.guard(() => _mqttDataSource.verifyMqtt(brokerIp));
  }

  @override
  Future<Result<Map<String, dynamic>>> checkMqttStatus() async {
    return await Result.guard(() => _mqttDataSource.checkMqttStatus());
  }

  @override
  Future<Result<void>> finalizeSetup() async {
    return await Result.guard(() => _mqttDataSource.finalizeSetup());
  }

  @override
  Future<Result<List<MqttSetupNetwork>>> scanNearbyDevices() async {
    return await Result.guard(() async {
      final networks = await _wifiDataSource.scanNearbyDevices();
      return networks
          .where((n) => n.ssid.contains(AppConstants.deviceSsidPrefix))
          .toList();
    });
  }

  @override
  Future<Result<bool>> connectToDevice(String ssid) async {
    return await Result.guard(() => _wifiDataSource.connectToDevice(ssid));
  }

  @override
  Future<void> disconnectFromDevice() async =>
      await _wifiDataSource.disconnectFromDevice();

  @override
  Future<void> setForceWifiUsage(bool use) async =>
      await _wifiDataSource.setForceWifiUsage(use);

  @override
  Future<Result<void>> reconfigureDevice({
    required String deviceId,
    required Map<String, dynamic> config,
  }) async {
    return await Result.guard(
      () => _mqttDataSource.publishReconfigure(deviceId, config),
    );
  }

  @override
  Future<Result<void>> sendMqttConfig({
    required String ssid,
    required String password,
    required String brokerIp,
    required String deviceId,
    required String ownerEmail,
  }) async {
    return await Result.guard(
      () => _mqttDataSource.postMqttConfig(
        ssid,
        password,
        brokerIp,
        deviceId,
        ownerEmail,
      ),
    );
  }

  @override
  Future<Result<String?>> checkWifiStatus() async {
    return await Result.guard(() => _mqttDataSource.checkWifiStatus());
  }

  @override
  Future<Result<List<MqttSetupNetwork>>> getAvailableNetworks() async {
    return await Result.guard(() => _mqttDataSource.getAvailableNetworks());
  }

  @override
  Stream<Map<String, LampStatus>> get multiDeviceStatusStream =>
      _mqttDataSource.multiDeviceStatusStream;

  @override
  Stream<ConnectionStatus> get connectionStatusStream =>
      _mqttDataSource.connectionStatusStream;

  @override
  Future<Result<void>> connect(
    String host,
    int port, {
    String? username,
    String? password,
  }) async {
    try {
      final String randomId = Random()
          .nextInt(999999)
          .toString()
          .padLeft(6, '0');
      final String clientId = "${AppConstants.mqttClientIdPrefix}$randomId";

      await _mqttDataSource.connect(
        host,
        port,
        clientId,
        username: username,
        password: password,
      );
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppException.network("연결 실패: $e"));
    }
  }

  @override
  Future<Result<void>> disconnect() async {
    try {
      await _mqttDataSource.disconnect();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppException.network("해제 실패: $e"));
    }
  }

  @override
  Future<Result<void>> sendCommand(
    String deviceId,
    LampStatus status, {
    String? description,
  }) async {
    return await Result.guard(
      () => _mqttDataSource.publishCommand(deviceId, status),
    );
  }

  @override
  Future<Result<void>> publishRaw(String topic, String jsonPayload) async {
    return await Result.guard(
      () => _mqttDataSource.publishRaw(topic, jsonPayload),
    );
  }

  @override
  Future<Result<void>> resetDevice(String deviceId) async {
    return await Result.guard(() => _mqttDataSource.resetDevice(deviceId));
  }
}
