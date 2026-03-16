import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_usecase_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_status_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_usecase_providers.dart';

part 'farm_rule_controller.g.dart';

@riverpod
class FarmRuleController extends _$FarmRuleController {
  final Map<int, bool> _lastExecutedActions = {};

  @override
  FutureOr<List<RuleEntity>> build(String deviceId) async {
    ref.listen(mqttLampStatusProvider(deviceId), (previous, next) {
      final lampStatus = next.value;
      if (lampStatus != null) {
        _checkAndExecuteRules(lampStatus);
      }
    });

    return _fetchRules();
  }

  void _checkAndExecuteRules(LampStatus status) {
    state.whenData((rules) {
      for (var rule in rules) {
        if (!rule.isActive) continue;

        bool conditionMet = false;
        final sensorType = rule.sensorType.toLowerCase();

        if (sensorType.contains('temp') || sensorType == 'temperature') {
          conditionMet = _evaluateCondition(
            status.temperature,
            rule.condition,
            rule.threshold,
          );
        } else if (sensorType.contains('humi') || sensorType == 'humidity') {
          conditionMet = _evaluateCondition(
            status.humidity,
            rule.condition,
            rule.threshold,
          );
        }

        if (conditionMet) {
          final cmd = rule.actionCommand.toUpperCase();
          final bool targetState = cmd == "POWER_ON" || cmd == "ON";

          if (_lastExecutedActions[rule.id] == targetState) continue;

          _executeAction(targetState, status);
          if (rule.id != null) _lastExecutedActions[rule.id!] = targetState;
        }
      }
    });
  }

  bool _evaluateCondition(double current, String condition, double threshold) {
    final cond = condition.toLowerCase();
    if (cond.contains('greater_than') || cond == 'gte' || cond == '>=') {
      return current >= threshold;
    } else if (cond.contains('less_than') || cond == 'lte' || cond == '<=') {
      return current <= threshold;
    }
    return false;
  }

  Future<void> _executeAction(
    bool targetState,
    LampStatus currentStatus,
  ) async {
    final actionStatus = currentStatus.copyWith(isOn: targetState);
    await ref
        .read(sendMqttCommandUseCaseProvider)
        .execute(deviceId, actionStatus);
  }

  Future<List<RuleEntity>> _fetchRules() async {
    final result = await ref.read(getRulesUseCaseProvider).execute();
    return result.when(
      success: (data) => data.where((r) => r.deviceId == deviceId).toList(),
      failure: (_) => [],
    );
  }

  Future<Result<void>> addRule(RuleEntity rule) async {
    state = const AsyncLoading();
    final result = await ref.read(createRuleUseCaseProvider).execute(rule);
    if (result is Success) {
      ref.invalidateSelf();
      return const Result.success(null);
    }
    return result;
  }

  Future<Result<void>> updateRule(RuleEntity rule) async {
    if (rule.id == null) {
      return Result.failure(const AppException.business("규칙 ID가 누락되었습니다."));
    }

    final result = await ref
        .read(updateRuleUseCaseProvider)
        .execute(rule.id!, rule);
    if (result is Success) {
      state.whenData((currentRules) {
        state = AsyncData(
          currentRules.map((r) => r.id == rule.id ? rule : r).toList(),
        );
      });
      return const Result.success(null);
    }
    return result;
  }

  Future<Result<void>> removeRule(int ruleId) async {
    final result = await ref.read(deleteRuleUseCaseProvider).execute(ruleId);
    if (result is Success) {
      state.whenData((currentRules) {
        state = AsyncData(currentRules.where((r) => r.id != ruleId).toList());
      });
      return const Result.success(null);
    }
    return result;
  }
}
