import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/data/datasources/farm_remote_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_providers.dart';

part 'device_sync_service.g.dart';

class DeviceSyncReport {
  final String deviceName;
  final bool isSuccess;
  final bool isNewlyAdded;
  final bool isCommandSent;
  final String? errorMessage;

  DeviceSyncReport({
    required this.deviceName,
    required this.isSuccess,
    this.isNewlyAdded = false,
    this.isCommandSent = false,
    this.errorMessage,
  });
}

@riverpod
DeviceSyncService deviceSyncService(Ref ref) {
  return DeviceSyncService(ref);
}

class DeviceSyncService {
  final Ref _ref;

  DeviceSyncService(this._ref);

  Future<Result<List<DeviceSyncReport>>> syncAllDevices({
    required String newApiUrl,
    required String newMqttHost,
    required String currentToken,
  }) async {
    try {
      final currentDevicesResult = await _ref
          .read(farmRepositoryProvider)
          .getMyDevices();

      List<DeviceEntity> sourceDevices = [];
      if (currentDevicesResult is Success<List<DeviceEntity>>) {
        sourceDevices = currentDevicesResult.data;
      } else {
        return Result.failure(
          const AppException.server("현재 기기 목록을 가져올 수 없습니다."),
        );
      }

      if (sourceDevices.isEmpty) return const Result.success([]);

      final newDio = Dio(
        BaseOptions(
          baseUrl: newApiUrl,
          headers: {'Authorization': 'Bearer $currentToken'},
          connectTimeout: const Duration(seconds: 5),
        ),
      );
      final targetSource = FarmRemoteDataSourceImpl(newDio);

      List<DeviceSyncReport> reports = [];

      for (var device in sourceDevices) {
        bool isNewlyAdded = false;
        bool isCommandSent = false;
        String? error;

        try {
          await targetSource.postRegisterDevice(device.deviceId, device.name);
          isNewlyAdded = true;
        } on DioException catch (e) {
          if (e.response?.statusCode == 400) {
            isNewlyAdded = false;
          } else {
            error = e.message;
          }
        }

        try {
          final controlTopic = "smartfarm/${device.deviceId}/control";
          final payload = jsonEncode({
            "cmd": "reconfig",
            "mqtt_broker": newMqttHost,
          });

          final mqttRepo = _ref.read(mqttRepositoryProvider);
          final cmdResult = await mqttRepo.publishRaw(controlTopic, payload);
          isCommandSent = cmdResult is Success;
        } catch (e) {
          AppLogger.w("Failed to send reconfig command to ${device.name}: $e");
        }

        reports.add(
          DeviceSyncReport(
            deviceName: device.name,
            isSuccess: error == null,
            isNewlyAdded: isNewlyAdded,
            isCommandSent: isCommandSent,
            errorMessage: error,
          ),
        );
      }

      return Result.success(reports);
    } catch (e) {
      return Result.failure(AppException.server("동기화 오류: $e"));
    }
  }
}
