import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';

abstract class FarmRepository {
  Future<Result<List<SensorHistory>>> getSensorHistory(
    String deviceId, {
    DateTime? from,
    DateTime? to,
  });

  Future<Result<void>> registerDevice(String deviceId, String name);

  Future<Result<List<DeviceEntity>>> getMyDevices();

  Future<Result<LampStatus?>> getLatestStatus(String deviceId);

  Future<Result<void>> updateDevice(String deviceId, String name);

  Future<Result<void>> deleteDevice(String deviceId);

  Future<Result<Map<String, dynamic>>> getSystemConfig();

  Future<Result<List<RuleEntity>>> getAllRules();

  Future<Result<void>> createRule(RuleEntity rule);

  Future<Result<void>> updateRule(int ruleId, RuleEntity rule);

  Future<Result<void>> deleteRule(int ruleId);

  Future<Result<void>> registerDeviceToken(String token, String platform);
}
