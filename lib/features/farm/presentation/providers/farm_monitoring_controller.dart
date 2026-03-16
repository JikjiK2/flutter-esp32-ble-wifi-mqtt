import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_usecase_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_control_controller.dart';

part 'farm_monitoring_controller.freezed.dart';

part 'farm_monitoring_controller.g.dart';

@freezed
sealed class FarmMonitoringState with _$FarmMonitoringState {
  const factory FarmMonitoringState({
    required LampStatus currentStatus,
    @Default([]) List<SensorHistory> history,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default("1H") String selectedPeriod,
  }) = _FarmMonitoringState;
}

@riverpod
class FarmMonitoringController extends _$FarmMonitoringController {
  @override
  FarmMonitoringState build(String deviceId) {
    final mqttInitialStatus = ref
        .read(mqttControlControllerProvider(deviceId))
        .localStatus;

    ref.listen<AsyncValue<SensorHistory?>>(
      sampledSensorStreamProvider(deviceId),
      (previous, next) {
        next.whenData((sensorData) {
          if (sensorData != null && !state.isLoading) {
            state = state.copyWith(
              currentStatus: state.currentStatus.copyWith(
                temperature: sensorData.temperature,
                humidity: sensorData.humidity,
              ),
            );
          }
        });
      },
    );

    final previousState = stateOrNull;

    return FarmMonitoringState(
      currentStatus: previousState?.currentStatus ?? mqttInitialStatus,
      history: previousState?.history ?? [],
      selectedPeriod: previousState?.selectedPeriod ?? "1H",
      isLoading: previousState?.isLoading ?? false,
    );
  }

  Future<void> fetchHistory({String period = "1H"}) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      selectedPeriod: period,
    );

    final getHistoryUseCase = ref.read(getSensorHistoryUseCaseProvider);
    final result = await getHistoryUseCase.execute(deviceId, period);

    if (result is Success<List<SensorHistory>>) {
      final data = List<SensorHistory>.from(result.data)
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      state = state.copyWith(history: data, isLoading: false);
    } else if (result is Failure<List<SensorHistory>>) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: result.exception.readableMessage,
      );
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
