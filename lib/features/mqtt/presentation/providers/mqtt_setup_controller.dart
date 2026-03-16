import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/util/gps_service.dart';
import 'package:flutter_esp32_ble_wifi/core/util/network_service.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/server_config_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_usecase_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_usecase_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_dashboard_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';

part 'mqtt_setup_controller.freezed.dart';

part 'mqtt_setup_controller.g.dart';

enum MqttSetupStep {
  guidelines,
  selectDevice,
  identity,
  selectWifi,
  finalize,
  success,
}

@freezed
sealed class MqttSetupState with _$MqttSetupState {
  const factory MqttSetupState({
    @Default('') String selectedDeviceId,
    @Default('') String deviceName,
    @Default('') String selectedSsid,
    @Default('') String wifiPassword,
    @Default('') String mqttIp,
    @Default([]) List<MqttSetupNetwork> scanResults,
    @Default(false) bool isScanning,
    @Default(false) bool isGpsOff,
    @Default(MqttSetupStep.guidelines) MqttSetupStep currentStep,
    String? stepError,
    @Default(false) bool isProcessing,
    @Default("") String loadingMessage,
  }) = _MqttSetupState;
}

@riverpod
class MqttSetupController extends _$MqttSetupController
    with WidgetsBindingObserver {
  bool _isCancelled = false;

  @override
  FutureOr<MqttSetupState> build() async {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _restoreNetworkQuietly();
    });

    final serverConfig = await ref.watch(serverConfigProvider.future);
    final bool isGpsOff = await Permission.location.serviceStatus.isDisabled;
    final String cloudMqttIp = serverConfig.mqttHost;

    return MqttSetupState(isGpsOff: isGpsOff, mqttIp: cloudMqttIp);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkConnectionIntegrity();
    }
  }

  void _updateState(MqttSetupState Function(MqttSetupState) update) {
    state = state.whenData(update);
  }

  Future<void> _checkConnectionIntegrity() async {
    final current = state.value;
    if (current == null ||
        current.currentStep.index < MqttSetupStep.identity.index ||
        current.isScanning ||
        current.isProcessing) {
      return;
    }

    final result = await ref.read(checkMqttWifiStatusUseCaseProvider).execute();
    if (result is Failure && ref.mounted) {
      _updateState(
        (s) => s.copyWith(
          currentStep: MqttSetupStep.selectDevice,
          stepError: "기기와의 연결이 끊어졌습니다.",
          isProcessing: false,
        ),
      );
    }
  }

  Future<void> _restoreNetworkQuietly() async {
    try {
      await ref.read(mqttSetForceWifiUseCaseProvider).execute(false);
      await ref.read(mqttDisconnectFromDeviceUseCaseProvider).execute();
    } catch (_) {}
  }

  Future<void> resetSession() async {
    state = const AsyncLoading();
    await _restoreNetworkQuietly();
    final serverConfig = await ref.read(serverConfigProvider.future);
    state = AsyncData(MqttSetupState(mqttIp: serverConfig.mqttHost));
  }

  void updateDeviceName(String name) =>
      _updateState((s) => s.copyWith(deviceName: name, stepError: null));

  void updateWifiPassword(String password) =>
      _updateState((s) => s.copyWith(wifiPassword: password, stepError: null));

  void selectSsid(String ssid) =>
      _updateState((s) => s.copyWith(selectedSsid: ssid, stepError: null));

  Future<void> startSetup() async {
    _updateState((s) => s.copyWith(currentStep: MqttSetupStep.selectDevice));
    await scanNearbyDevices();
  }

  Future<void> scanWifi() async {
    final step = state.value?.currentStep;
    if (step == MqttSetupStep.selectDevice) {
      await scanNearbyDevices();
    } else if (step == MqttSetupStep.selectWifi) {
      await getTargetWifiNetworks();
    }
  }

  Future<void> scanNearbyDevices() async {
    _updateState(
      (s) => s.copyWith(isScanning: true, stepError: null, isGpsOff: false),
    );

    try {
      if (!await _ensureLocationAndGps()) return;
      final result = await ref
          .read(mqttDeviceDiscoveryUseCaseProvider)
          .execute();
      if (!ref.mounted) return;

      switch (result) {
        case Success<List<MqttSetupNetwork>>(data: final devices):
          _updateState(
            (s) => s.copyWith(scanResults: devices, isScanning: false),
          );
        case Failure(exception: final e):
          _updateState(
            (s) => s.copyWith(isScanning: false, stepError: e.readableMessage),
          );
      }
    } catch (e) {
      _updateState((s) => s.copyWith(isScanning: false, stepError: "기기 스캔 오류"));
    }
  }

  Future<void> connectToDevice(String ssid) async {
    _updateState(
      (s) => s.copyWith(
        isProcessing: true,
        loadingMessage: "기기에 접속하고 있습니다...",
        stepError: null,
      ),
    );

    try {
      await ref.read(mqttDisconnectFromDeviceUseCaseProvider).execute();
      final result = await ref
          .read(mqttConnectToDeviceUseCaseProvider)
          .execute(ssid);

      if (!ref.mounted) return;

      if (result is Success<bool> && result.data) {
        await ref.read(mqttSetForceWifiUseCaseProvider).execute(true);
        _updateState(
          (s) => s.copyWith(
            selectedDeviceId: ssid.replaceAll("_Setup", ""),
            selectedSsid: ssid,
            currentStep: MqttSetupStep.identity,
            isProcessing: false,
            scanResults: [],
          ),
        );
      } else {
        throw const AppException.network("기기 연결 실패");
      }
    } catch (e) {
      _updateState((s) => s.copyWith(isProcessing: false, stepError: "연결 오류"));
    }
  }

  Future<void> getTargetWifiNetworks() async {
    _updateState((s) => s.copyWith(isScanning: true, stepError: null));

    try {
      final result = await ref
          .read(getMqttAvailableNetworksUseCaseProvider)
          .execute();
      if (!ref.mounted) return;

      switch (result) {
        case Success<List<MqttSetupNetwork>>(data: final networks):
          _updateState(
            (s) => s.copyWith(scanResults: networks, isScanning: false),
          );
        case Failure(exception: final _):
          _updateState(
            (s) => s.copyWith(isScanning: false, stepError: "WiFi 목록 조회 실패"),
          );
      }
    } catch (e) {
      _updateState(
        (s) => s.copyWith(isScanning: false, stepError: "WiFi 조회 중 오류"),
      );
    }
  }

  void onWifiSelected(
    MqttSetupNetwork network, {
    required Function(String ssid) onRequirePassword,
  }) {
    _updateState((s) => s.copyWith(selectedSsid: network.ssid));
    if (network.isSecure) {
      onRequirePassword(network.ssid);
    } else {
      nextStep();
    }
  }

  void nextStep() {
    state.whenData((current) {
      if (current.currentStep == MqttSetupStep.selectWifi) {
        startCombinedVerification();
      } else if (current.currentStep.index < MqttSetupStep.values.length - 1) {
        final next = MqttSetupStep.values[current.currentStep.index + 1];
        _updateState(
          (s) => s.copyWith(
            currentStep: next,
            stepError: null,
            scanResults: next == MqttSetupStep.selectWifi ? s.scanResults : [],
          ),
        );

        if (next == MqttSetupStep.selectWifi) {
          getTargetWifiNetworks();
        }
      }
    });
  }

  void cancelProcessing() {
    _isCancelled = true;
    _updateState(
      (s) => s.copyWith(
        isProcessing: false,
        loadingMessage: "",
        stepError: "사용자에 의해 중단되었습니다.",
      ),
    );
  }

  Future<void> startCombinedVerification() async {
    _isCancelled = false;

    _updateState(
      (s) => s.copyWith(
        isProcessing: true,
        loadingMessage: "설정 정보를 기기에 전송 중...",
        stepError: null,
      ),
    );

    final currentState = state.value!;

    try {
      final user = ref.read(authStateProvider).value;
      final String ownerEmail = user?.email ?? "";

      final result = await ref
          .read(mqttSendConfigUseCaseProvider)
          .execute(
            ssid: currentState.selectedSsid,
            password: currentState.wifiPassword,
            brokerIp: currentState.mqttIp,
            deviceId: currentState.selectedDeviceId,
            ownerEmail: ownerEmail,
          );

      if (_isCancelled) return;

      if (result is Failure) {
        _updateState(
          (s) =>
              s.copyWith(isProcessing: false, stepError: "기기에 정보를 전달하지 못했습니다."),
        );
        return;
      }

      _updateState(
        (s) => s.copyWith(loadingMessage: "기기가 네트워크에 접속 중입니다...\n(최대 30초 소요)"),
      );

      bool wifiOk = false;
      bool mqttOk = false;

      for (int i = 0; i < 15; i++) {
        if (_isCancelled) return;
        await Future.delayed(const Duration(seconds: 2));
        if (_isCancelled) return;

        final statusResult = await ref
            .read(checkMqttConnectionStatusUseCaseProvider)
            .execute();

        if (statusResult is Success<Map<String, dynamic>>) {
          wifiOk = statusResult.data['wifi_connected'] ?? false;
          mqttOk = statusResult.data['mqtt_connected'] ?? false;

          if (wifiOk && mqttOk) break;

          if (wifiOk && !mqttOk) {
            _updateState(
              (s) => s.copyWith(
                loadingMessage: "WiFi 연결 성공! 🚀\n이제 서버 접속을 확인 중입니다...",
              ),
            );
          }
        }
      }

      if (_isCancelled) return;

      if (wifiOk && mqttOk) {
        _updateState(
          (s) => s.copyWith(
            currentStep: MqttSetupStep.finalize,
            isProcessing: false,
            stepError: null,
          ),
        );
      } else {
        _updateState(
          (s) =>
              s.copyWith(isProcessing: false, stepError: "연결 확인 시간이 초과되었습니다."),
        );
      }
    } catch (e) {
      if (!_isCancelled) {
        _updateState(
          (s) => s.copyWith(isProcessing: false, stepError: "검증 중 오류가 발생했습니다."),
        );
      }
    }
  }

  Future<void> completeRegistration() async {
    _updateState(
      (s) => s.copyWith(
        isProcessing: true,
        loadingMessage: "네트워크 복구 및 등록 완료 중...",
      ),
    );

    try {
      await ref
          .read(mqttFinalizeSetupUseCaseProvider)
          .execute()
          .timeout(const Duration(seconds: 3));
      await _restoreNetworkQuietly();
      await ref.read(networkServiceProvider).waitForInternet(maxRetries: 25);

      bool registrationSuccess = false;
      int retryCount = 0;

      while (retryCount < 5 && !registrationSuccess) {
        final result = await ref
            .read(registerDeviceUseCaseProvider)
            .execute(state.value!.selectedDeviceId, state.value!.deviceName);
        if (result is Success) {
          registrationSuccess = true;
          break;
        }
        retryCount++;
        await Future.delayed(const Duration(seconds: 2));
      }

      if (registrationSuccess) {
        ref.invalidate(farmDashboardProvider);
        _updateState(
          (s) => s.copyWith(
            currentStep: MqttSetupStep.success,
            isProcessing: false,
          ),
        );
      } else {
        _updateState(
          (s) => s.copyWith(isProcessing: false, stepError: "최종 서버 등록 실패."),
        );
      }
    } catch (e) {
      _updateState(
        (s) => s.copyWith(isProcessing: false, stepError: "최종 등록 과정 중 오류 발생"),
      );
    }
  }

  void previousStep() {
    final current = state.value;
    if (current != null && current.currentStep.index > 0) {
      _updateState(
        (s) => s.copyWith(
          currentStep: MqttSetupStep.values[current.currentStep.index - 1],
          stepError: null,
          scanResults: [],
        ),
      );
    }
  }

  Future<bool> _ensureLocationAndGps() async {
    var status = await Permission.location.status;
    if (status.isDenied) status = await Permission.location.request();
    return status.isGranted &&
        await ref.read(gpsServiceProvider).ensureGpsEnabled();
  }
}
