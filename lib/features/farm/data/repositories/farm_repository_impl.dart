import 'dart:async';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/network/dio_provider.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/data/datasources/farm_remote_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/repositories/farm_repository.dart';

part 'farm_repository_impl.g.dart';

@riverpod
FarmRemoteDataSource farmRemoteDataSource(Ref ref) {
  final dio = ref.watch(authenticatedDioProvider);
  return FarmRemoteDataSourceImpl(dio);
}

@riverpod
FarmRepository farmRepositoryImpl(Ref ref) {
  final dataSource = ref.watch(farmRemoteDataSourceProvider);
  return FarmRepositoryImpl(dataSource);
}

class FarmRepositoryImpl implements FarmRepository {
  final FarmRemoteDataSource _remoteDataSource;

  FarmRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<SensorHistory>>> getSensorHistory(
    String deviceId, {
    DateTime? from,
    DateTime? to,
  }) async {
    return await Result.guard(() async {
      final models = await _remoteDataSource.getSensorHistory(
        deviceId,
        from: from,
        to: to,
      );
      return models.map((m) => m.toEntity()).toList();
    });
  }

  @override
  Future<Result<LampStatus?>> getLatestStatus(String deviceId) async {
    return await Result.guard(() async {
      try {
        return await _remoteDataSource.getLatestStatus(deviceId);
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) return null;
        rethrow;
      }
    });
  }

  @override
  Future<Result<void>> registerDevice(String deviceId, String name) async {
    return await Result.guard(
      () => _remoteDataSource.postRegisterDevice(deviceId, name),
    );
  }

  @override
  Future<Result<List<DeviceEntity>>> getMyDevices() async {
    return await Result.guard(() async {
      final models = await _remoteDataSource.getMyDevices();
      return models.map((m) => m.toEntity()).toList();
    });
  }

  @override
  Future<Result<void>> updateDevice(String deviceId, String name) async {
    return await Result.guard(
      () => _remoteDataSource.putUpdateDevice(deviceId, name),
    );
  }

  @override
  Future<Result<void>> deleteDevice(String deviceId) async {
    return await Result.guard(() => _remoteDataSource.deleteDevice(deviceId));
  }

  @override
  Future<Result<Map<String, dynamic>>> getSystemConfig() async {
    return await Result.guard(() => _remoteDataSource.getSystemConfig());
  }

  @override
  Future<Result<List<RuleEntity>>> getAllRules() async {
    return await Result.guard(() async {
      final rawRules = await _remoteDataSource.getAllRules();
      return rawRules.map((json) => RuleEntity.fromJson(json)).toList();
    });
  }

  @override
  Future<Result<void>> createRule(RuleEntity rule) async {
    return await Result.guard(() => _remoteDataSource.postCreateRule(rule));
  }

  @override
  Future<Result<void>> updateRule(int ruleId, RuleEntity rule) async {
    return await Result.guard(
      () => _remoteDataSource.putUpdateRule(ruleId, rule),
    );
  }

  @override
  Future<Result<void>> deleteRule(int ruleId) async {
    return await Result.guard(() => _remoteDataSource.deleteRule(ruleId));
  }

  @override
  Future<Result<void>> registerDeviceToken(
    String token,
    String platform,
  ) async {
    return await Result.guard(
      () => _remoteDataSource.postRegisterDeviceToken(token, platform),
    );
  }
}
