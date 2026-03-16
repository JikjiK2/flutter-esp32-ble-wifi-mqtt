import 'dart:async';
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/global_error_provider.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/server_config_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_status_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_usecase_providers.dart';

part 'mqtt_control_controller.freezed.dart';

part 'mqtt_control_controller.g.dart';

@freezed
sealed class MqttControlState with _$MqttControlState {
  const factory MqttControlState({
    required LampStatus localStatus,
    @Default(false) bool isInteracting,
    @Default(ConnectionStatus.disconnected) ConnectionStatus connectionStatus,
    @Default(false) bool isInitialLoading,
  }) = _MqttControlState;
}

@Riverpod(keepAlive: true)
class MqttControlController extends _$MqttControlController {
  Timer? _interactionTimer;

  @override
  MqttControlState build(String deviceId) {
    final normalizedId = deviceId.trim().toLowerCase();

    final lampStatusAsync = ref.watch(mqttLampStatusProvider(normalizedId));
    final connStatusAsync = ref.watch(mqttConnectionStatusProvider('all'));

    final remoteStatus = lampStatusAsync.value ?? LampStatus.initial();
    final connStatus = connStatusAsync.value ?? ConnectionStatus.disconnected;

    final previousState = stateOrNull;

    if (previousState != null && previousState.isInteracting) {
      return previousState.copyWith(
        connectionStatus: connStatus,
        isInitialLoading: false,
        localStatus: previousState.localStatus.copyWith(
          temperature: remoteStatus.temperature,
          humidity: remoteStatus.humidity,
          rssi: remoteStatus.rssi,
        ),
      );
    }

    return MqttControlState(
      localStatus: remoteStatus,
      connectionStatus: connStatus,
      isInitialLoading:
          lampStatusAsync.isLoading &&
          connStatus == ConnectionStatus.connecting,
    );
  }

  Future<void> connect() async {
    if (state.connectionStatus == ConnectionStatus.connected ||
        state.connectionStatus == ConnectionStatus.connecting) {
      return;
    }

    final serverConfig = ref.read(serverConfigProvider).value;
    if (serverConfig == null) return;

    final user = ref.read(authStateProvider).value;
    final token = await ref.read(authRepositoryProvider).token;

    if (user != null && token != null) {
      final String hostRaw = serverConfig.mqttHost;

      String host = hostRaw;
      int port = 1883;

      if (hostRaw.contains(':')) {
        final parts = hostRaw.split(':');
        host = parts.first;
        port = int.tryParse(parts.last) ?? 1883;
      }

      AppLogger.i(
        "📡 [MQTT] Connecting to $host via port $port",
        tag: 'MQTT-CTRL',
      );

      final result = await ref
          .read(connectMqttUseCaseProvider)
          .execute(host, port, username: user.email, password: token);

      if (result is Failure) {
        ref.read(globalErrorProvider.notifier).showError(result.exception);
      }
    }
  }

  void togglePower(bool isOn) => updateStatus(isOn: isOn);

  void updateStatus({
    bool? isOn,
    int? brightness,
    int? color,
    int? ledMode,
    int? brightMode,
  }) {
    final oldStatus = state.localStatus;
    final updatedStatus = oldStatus.copyWith(
      isOn: isOn ?? oldStatus.isOn,
      brightness: brightness ?? oldStatus.brightness,
      color: color ?? oldStatus.color,
      ledMode: ledMode ?? oldStatus.ledMode,
      brightMode: brightMode ?? oldStatus.brightMode,
    );

    state = state.copyWith(localStatus: updatedStatus, isInteracting: true);

    _interactionTimer?.cancel();
    _interactionTimer = Timer(const Duration(seconds: 5), () {
      if (ref.mounted) state = state.copyWith(isInteracting: false);
    });

    ref.read(sendMqttCommandUseCaseProvider).execute(deviceId, updatedStatus);
  }

  Future<void> requestWifiScan() async {
    final result = await ref
        .read(remoteWifiScanUseCaseProvider)
        .execute(deviceId);

    if (ref.mounted && result is Failure) {
      ref.read(globalErrorProvider.notifier).showError(result.exception);
    }
  }

  Future<void> reconfigureWifi({required String ssid, String? password}) async {
    final result = await ref
        .read(wifiReconfigureRemoteUseCaseProvider)
        .execute(deviceId: deviceId, ssid: ssid, password: password);

    if (ref.mounted && result is Failure) {
      ref.read(globalErrorProvider.notifier).showError(result.exception);
    }
  }

  Future<void> publish(Map<String, dynamic> payload) async {
    final jsonPayload = jsonEncode(payload);
    final result = await ref
        .read(mqttPublishRawUseCaseProvider)
        .execute(deviceId, jsonPayload);

    if (ref.mounted && result is Failure) {
      ref.read(globalErrorProvider.notifier).showError(result.exception);
    }
  }

  Future<void> disconnect() async {
    await ref.read(disconnectMqttUseCaseProvider).execute();
  }
}
