import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/global_error_provider.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_usecase_providers.dart';

part 'ble_control_controller.freezed.dart';
part 'ble_control_controller.g.dart';

@freezed
sealed class BleControlState with _$BleControlState {
  const factory BleControlState({
    required LampStatus localStatus,
    @Default(false) bool isInteracting,
  }) = _BleControlState;
}

@riverpod
class BleControlController extends _$BleControlController {
  Timer? _debounceTimer;
  Timer? _interactionTimer;

  @override
  BleControlState build(String macId) {
        final statusAsync = ref.watch(bleStatusStreamProvider(macId));
    final rssiAsync = ref.watch(bleRssiStreamProvider(macId));

    final previousState = stateOrNull;
    
    final remoteStatus = statusAsync.maybeWhen(
      data: (data) => data,
      orElse: () => previousState?.localStatus ?? LampStatus.initial(),
    );
    final currentRssi = rssiAsync.value ?? previousState?.localStatus.rssi ?? -100;

    if (previousState != null && previousState.isInteracting) {
      return previousState.copyWith(
        localStatus: previousState.localStatus.copyWith(
          temperature: remoteStatus.temperature,
          humidity: remoteStatus.humidity,
          rssi: currentRssi,
        ),
      );
    }

    return BleControlState(
      localStatus: remoteStatus.copyWith(rssi: currentRssi),
    );
  }

  void _updateState(BleControlState Function(BleControlState) update) {
    state = update(state);
  }

  Future<void> requestSync(String macId) async {
    final result = await ref.read(requestBleSyncUseCaseProvider).execute(macId);
    if (result is Failure) {
      ref.read(globalErrorProvider.notifier).showError(result.exception);
    }
  }

  void updateStatus(
    String macId, {
    bool? isOn,
    int? brightness,
    int? color,
    int? ledMode,
    int? brightMode,
  }) {
    final updatedStatus = state.localStatus.copyWith(
      isOn: isOn ?? state.localStatus.isOn,
      brightness: brightness ?? state.localStatus.brightness,
      color: color ?? state.localStatus.color,
      ledMode: ledMode ?? state.localStatus.ledMode,
      brightMode: brightMode ?? state.localStatus.brightMode,
    );

    _updateState((s) => s.copyWith(localStatus: updatedStatus, isInteracting: true));

    _interactionTimer?.cancel();
    _interactionTimer = Timer(const Duration(seconds: 5), () {
      if (ref.mounted) _updateState((s) => s.copyWith(isInteracting: false));
    });

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 200), () async {
      final result = await ref.read(sendLampStatusUseCaseProvider).execute(macId, state.localStatus);
      if (ref.mounted && result is Failure) {
        ref.read(globalErrorProvider.notifier).showError(result.exception);
      }
    });
  }
}

@riverpod
class BleConnection extends _$BleConnection {
  @override
  FutureOr<String?> build() => null;

  Future<void> connect(String macId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final callResult = await ref.read(connectDeviceUseCaseProvider).execute(macId);
      if (callResult is Failure) throw callResult.exception;
      return macId;
    });
  }

  Future<void> disconnect() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(disconnectDeviceUseCaseProvider).execute();
      return null;
    });
  }
}
