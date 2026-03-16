import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/global_error_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_usecase_providers.dart';

part 'wifi_control_controller.freezed.dart';

part 'wifi_control_controller.g.dart';

@freezed
sealed class WifiControlState with _$WifiControlState {
  const factory WifiControlState({
    required LampStatus localStatus,
    @Default(false) bool isInteracting,
    @Default(ConnectionStatus.disconnected) ConnectionStatus connectionStatus,
    String? currentIp,
    @Default(false) bool isDiscovering,
    @Default(true) bool isInitialLoading,
  }) = _WifiControlState;
}

@Riverpod(keepAlive: true)
class WifiControlController extends _$WifiControlController {
  Timer? _debounceTimer;
  Timer? _interactionTimer;

  @override
  WifiControlState build() {
    final statusAsync = ref.watch(wifiStatusStreamProvider);
    final previousState = stateOrNull;

    final remoteStatus = statusAsync.maybeWhen(
      data: (data) => data,
      orElse: () => previousState?.localStatus ?? LampStatus.initial(),
    );

    bool stillLoading = previousState?.isInitialLoading ?? true;
    ConnectionStatus connStatus =
        previousState?.connectionStatus ?? ConnectionStatus.disconnected;

    if (statusAsync.hasValue && statusAsync.value?.timestamp != null) {
      stillLoading = false;
      connStatus = ConnectionStatus.connected;
    }

    return WifiControlState(
      localStatus: remoteStatus,
      connectionStatus: connStatus,
      currentIp: previousState?.currentIp,
      isDiscovering: previousState?.isDiscovering ?? false,
      isInitialLoading: stillLoading,
    );
  }

  Future<void> autoConnect() async {
    if (state.connectionStatus == ConnectionStatus.connected) return;

    state = state.copyWith(
      connectionStatus: ConnectionStatus.connecting,
      isDiscovering: true,
      isInitialLoading: true,
      currentIp: null,
    );

    final savedInfo = ref.read(savedDeviceInfoProvider).value;
    if (savedInfo == null || savedInfo.deviceId == null) {
      _handleError("저장된 기기 정보가 없습니다.");
      return;
    }

    final String targetId = savedInfo.deviceId!;
    _logInfo("Auto-discovering device via mDNS: $targetId");

    final discoveryResult = await ref
        .read(discoverWifiDeviceUseCaseProvider)
        .execute(targetId);

    if (!ref.mounted) return;

    String? targetIp;
    discoveryResult.when(
      success: (ip) {
        _logInfo("mDNS Discovery Success: $ip");
        targetIp = ip;
      },
      failure: (e) {
        _logInfo("mDNS Discovery Failed. Falling back to saved IP.");
        targetIp = savedInfo.deviceIp;
      },
    );

    state = state.copyWith(isDiscovering: false);

    if (targetIp == null || targetIp!.isEmpty) {
      _handleError("기기 IP 주소를 찾을 수 없습니다.");
      return;
    }

    await connect(targetIp!);
  }

  Future<void> connect(String host) async {
    state = state.copyWith(
      connectionStatus: ConnectionStatus.connecting,
      currentIp: host,
    );

    for (int i = 0; i < 3; i++) {
      final result = await ref
          .read(connectWifiControlUseCaseProvider)
          .execute(host);
      if (result is Success) {
        if (ref.mounted) {
          _logInfo("WebSocket Connection Successful, waiting for data...");
        }
        return;
      }
      if (!ref.mounted) return;
      await Future.delayed(Duration(seconds: 1 * (i + 1)));
    }

    _handleError("기기 연결에 실패했습니다.");
  }

  void _logInfo(String message) {
    AppLogger.i(message, tag: 'WIFI-CTRL');
    ref.read(wifiDataLogProvider.notifier).addTx("ℹ️ $message");
  }

  void _handleError(String message) {
    state = state.copyWith(
      connectionStatus: ConnectionStatus.error,
      isDiscovering: false,
      isInitialLoading: false,
    );
    _logInfo("ERROR: $message");
    ref
        .read(globalErrorProvider.notifier)
        .showError(AppException.network(message));
  }

  Future<void> disconnect() async {
    await ref.read(disconnectWifiControlUseCaseProvider).execute();
    state = state.copyWith(
      connectionStatus: ConnectionStatus.disconnected,
      currentIp: null,
      isInitialLoading: true,
    );
    _logInfo("Disconnected from device.");
  }

  void updateStatus({
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

    state = state.copyWith(localStatus: updatedStatus, isInteracting: true);

    _interactionTimer?.cancel();
    _interactionTimer = Timer(const Duration(seconds: 5), () {
      if (ref.mounted) state = state.copyWith(isInteracting: false);
    });

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 200), () async {
      final result = await ref
          .read(sendWifiCommandUseCaseProvider)
          .execute(state.localStatus);
      if (ref.mounted && result is Failure) {
        ref.read(globalErrorProvider.notifier).showError(result.exception);
      }
    });
  }
}
