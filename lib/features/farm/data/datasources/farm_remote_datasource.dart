import 'package:dio/dio.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/data/models/device_model.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/data/models/sensor_data_model.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';

abstract class FarmRemoteDataSource {
  Future<List<SensorDataModel>> getSensorHistory(
    String deviceId, {
    DateTime? from,
    DateTime? to,
  });

  Future<void> postRegisterDevice(String deviceId, String name);

  Future<List<DeviceModel>> getMyDevices();

  Future<LampStatus?> getLatestStatus(String deviceId);

  Future<void> putUpdateDevice(String deviceId, String name);

  Future<void> deleteDevice(String deviceId);

  Future<Map<String, dynamic>> getSystemConfig();

  Future<List<dynamic>> getAllRules();

  Future<void> postCreateRule(RuleEntity rule);

  Future<void> putUpdateRule(int ruleId, RuleEntity rule);

  Future<void> deleteRule(int ruleId);

  Future<void> postRegisterDeviceToken(String token, String platform);
}

class FarmRemoteDataSourceImpl implements FarmRemoteDataSource {
  final Dio _dio;

  FarmRemoteDataSourceImpl(this._dio);

  @override
  Future<List<DeviceModel>> getMyDevices() async {
    final response = await _dio.get(AppConstants.apiDevices);
    if (response.data is List) {
      return (response.data as List)
          .map((e) => DeviceModel.fromJson(e))
          .toList();
    }
    return [];
  }

  @override
  Future<void> deleteDevice(String deviceId) async =>
      await _dio.delete("${AppConstants.apiDevices}$deviceId");

  @override
  Future<void> putUpdateDevice(String deviceId, String name) async {
    await _dio.put(
      "${AppConstants.apiDevices}$deviceId",
      data: {"name": name, "device_id": deviceId},
    );
  }

  @override
  Future<LampStatus?> getLatestStatus(String deviceId) async {
    try {
      final response = await _dio.get(
        "${AppConstants.apiSensorsLatest}$deviceId",
      );
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final model = SensorDataModel.fromJson(data);
        return LampStatus(
          deviceId: deviceId,
          temperature: model.temperature,
          humidity: model.humidity,
          timestamp: DateTime.parse(model.timestamp).toLocal(),
          isOn: true,
        );
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<SensorDataModel>> getSensorHistory(
    String deviceId, {
    DateTime? from,
    DateTime? to,
  }) async {
    final Map<String, dynamic> queryParams = {};
    if (from != null) {
      queryParams["start_time"] = from.toUtc().toIso8601String();
    }
    if (to != null) queryParams["end_time"] = to.toUtc().toIso8601String();
    final response = await _dio.get(
      "${AppConstants.apiSensorsHistory}$deviceId",
      queryParameters: queryParams,
    );
    if (response.data is List) {
      return (response.data as List)
          .map((json) => SensorDataModel.fromJson(json))
          .toList();
    }
    return [];
  }

  @override
  Future<void> postRegisterDevice(String deviceId, String name) async =>
      await _dio.post(
        AppConstants.apiDevices,
        data: {"device_id": deviceId, "name": name},
      );

  @override
  Future<Map<String, dynamic>> getSystemConfig() async {
    final response = await _dio.get(AppConstants.apiConfigMqtt);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<List<dynamic>> getAllRules() async {
    final response = await _dio.get(AppConstants.apiRules);
    return response.data as List<dynamic>;
  }

  @override
  Future<void> postCreateRule(RuleEntity rule) async =>
      await _dio.post(AppConstants.apiRules, data: rule.toJson());

  @override
  Future<void> putUpdateRule(int ruleId, RuleEntity rule) async {
    await _dio.put("${AppConstants.apiRules}$ruleId", data: rule.toJson());
  }

  @override
  Future<void> deleteRule(int ruleId) async =>
      await _dio.delete("${AppConstants.apiRules}$ruleId");

  @override
  Future<void> postRegisterDeviceToken(String token, String platform) async {
    await _dio.post(
      AppConstants.apiNotificationsRegister,
      data: {"token": token, "platform": platform},
    );
  }
}
