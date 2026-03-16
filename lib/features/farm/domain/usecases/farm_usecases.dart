import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/repositories/farm_repository.dart';

class GetSensorHistoryUseCase {
  final FarmRepository _repository;

  GetSensorHistoryUseCase(this._repository);

  Future<Result<List<SensorHistory>>> execute(
    String deviceId,
    String period,
  ) async {
    final now = DateTime.now().toUtc();
    DateTime from;

    if (period == "6H") {
      from = now.subtract(const Duration(hours: 6));
    } else if (period == "24H") {
      from = now.subtract(const Duration(hours: 24));
    } else {
      from = now.subtract(const Duration(hours: 1));
    }

    final result = await _repository.getSensorHistory(
      deviceId,
      from: from,
      to: now,
    );

    if (result is Success<List<SensorHistory>>) {
      final rawData = result.data;
      return Result.success(_sampleToExactPoints(rawData, 10));
    }
    return result;
  }

  List<SensorHistory> _sampleToExactPoints(
    List<SensorHistory> raw,
    int targetCount,
  ) {
    if (raw.isEmpty) return [];
    if (raw.length <= targetCount) return raw;

    final List<SensorHistory> sampled = [];
    final double step = (raw.length - 1) / (targetCount - 1);

    for (int i = 0; i < targetCount; i++) {
      int index = (i * step).round();
      if (index < raw.length) {
        sampled.add(raw[index]);
      }
    }
    return sampled;
  }
}

class RegisterFarmDeviceUseCase {
  final FarmRepository _repository;

  RegisterFarmDeviceUseCase(this._repository);

  Future<Result<void>> execute(String deviceId, String name) async {
    if (name.trim().length < 2) {
      return Result.failure(
        const AppException.business("기기 이름은 최소 2자 이상이어야 합니다."),
      );
    }
    return await _repository.registerDevice(deviceId, name.trim());
  }
}

class CreateRuleUseCase {
  final FarmRepository _repository;

  CreateRuleUseCase(this._repository);

  Future<Result<void>> execute(RuleEntity rule) async {
    if (rule.name.isEmpty) {
      return Result.failure(const AppException.business("규칙 이름을 입력해 주세요."));
    }
    if (rule.threshold < 0 || rule.threshold > 100) {
      return Result.failure(
        const AppException.business("임계값은 0에서 100 사이여야 합니다."),
      );
    }
    return await _repository.createRule(rule);
  }
}

class UpdateFarmDeviceUseCase {
  final FarmRepository _repository;

  UpdateFarmDeviceUseCase(this._repository);

  Future<Result<void>> execute(String deviceId, String name) =>
      _repository.updateDevice(deviceId, name);
}

class DeleteFarmDeviceUseCase {
  final FarmRepository _repository;

  DeleteFarmDeviceUseCase(this._repository);

  Future<Result<void>> execute(String deviceId) =>
      _repository.deleteDevice(deviceId);
}

class GetMyDevicesUseCase {
  final FarmRepository _repository;

  GetMyDevicesUseCase(this._repository);

  Future<Result<List<DeviceEntity>>> execute() => _repository.getMyDevices();
}

class GetLatestStatusUseCase {
  final FarmRepository _repository;

  GetLatestStatusUseCase(this._repository);

  Future<Result<LampStatus?>> execute(String deviceId) =>
      _repository.getLatestStatus(deviceId);
}

class GetRulesUseCase {
  final FarmRepository _repository;

  GetRulesUseCase(this._repository);

  Future<Result<List<RuleEntity>>> execute() => _repository.getAllRules();
}

class UpdateRuleUseCase {
  final FarmRepository _repository;

  UpdateRuleUseCase(this._repository);

  Future<Result<void>> execute(int ruleId, RuleEntity rule) =>
      _repository.updateRule(ruleId, rule);
}

class DeleteRuleUseCase {
  final FarmRepository _repository;

  DeleteRuleUseCase(this._repository);

  Future<Result<void>> execute(int ruleId) => _repository.deleteRule(ruleId);
}
