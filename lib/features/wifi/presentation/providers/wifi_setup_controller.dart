import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/util/gps_service.dart';
import 'package:flutter_esp32_ble_wifi/core/util/network_service.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_config_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_network_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_usecase_providers.dart';

part 'wifi_setup_controller.freezed.dart';

part 'wifi_setup_controller.g.dart';

enum WifiSetupStep {
  guidelines,
  selectDevice,
  selectTargetWifi,
  success,
  completing,
}

@freezed
sealed class WifiSetupState with _$WifiSetupState {
  const factory WifiSetupState({
    @Default('') String selectedDeviceId,
    @Default('') String selectedSsid,
    @Default('') String wifiPassword,
    @Default([]) List<WifiNetwork> scanResults,
    @Default(false) bool isScanning,
    @Default(WifiSetupStep.guidelines) WifiSetupStep currentStep,
    String? stepError,
    @Default(false) bool isProcessing,
    @Default("") String loadingMessage,
  }) = _WifiSetupState;
}

@riverpod
class WifiSetupController extends _$WifiSetupController
    with WidgetsBindingObserver {
  bool _isCancelled = false;

  @override
  FutureOr<WifiSetupState> build() {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _restoreNetworkQuietly();
    });
    return const WifiSetupState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkConnectionIntegrity();
    }
  }

  void _updateState(WifiSetupState Function(WifiSetupState) update) {
    state = state.whenData(update);
  }

  Future<void> _checkConnectionIntegrity() async {
    final current = state.value;
    if (current == null ||
        current.currentStep != WifiSetupStep.selectTargetWifi ||
        current.isScanning ||
        current.isProcessing) {
      return;
    }

    final result = await ref.read(checkWifiStatusUseCaseProvider).execute();
    if (result is Failure && ref.mounted) {
      AppLogger.w("Connection lost. Resetting to step 1.", tag: 'WIFI-SETUP');
      _updateState(
        (s) => s.copyWith(
          currentStep: WifiSetupStep.selectDevice,
          stepError: "기기와의 연결이 끊어졌습니다. 다시 시도해 주세요.",
          isProcessing: false,
        ),
      );
    }
  }

  Future<void> _restoreNetworkQuietly() async {
    try {
      await ref.read(wifiSetForceUsageUseCaseProvider).execute(false);
      await ref.read(wifiDisconnectFromDeviceUseCaseProvider).execute();
    } catch (_) {}
  }

  void updateWifiPassword(String password) =>
      _updateState((s) => s.copyWith(wifiPassword: password));

  void selectSsid(String ssid) =>
      _updateState((s) => s.copyWith(selectedSsid: ssid, stepError: null));

  Future<void> startSetup() async {
    _updateState((s) => s.copyWith(currentStep: WifiSetupStep.selectDevice));
    await scanNearbyDevices();
  }

  Future<void> scanWifi() async {
    final step = state.value?.currentStep;
    if (step == WifiSetupStep.selectDevice) {
      await scanNearbyDevices();
    } else if (step == WifiSetupStep.selectTargetWifi) {
      await getTargetWifiNetworks();
    }
  }

  Future<void> scanNearbyDevices() async {
    _updateState((s) => s.copyWith(isScanning: true, stepError: null));

    try {
      if (!await _ensureLocationAndGps()) return;
      final result = await ref.read(getWifiDevicesUseCaseProvider).execute();
      if (!ref.mounted) return;

      switch (result) {
        case Success<List<WifiNetwork>>(data: final devices):
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
      final result = await ref
          .read(wifiConnectToDeviceUseCaseProvider)
          .execute(ssid);
      if (!ref.mounted) return;

      switch (result) {
        case Success<bool>(data: final success):
          if (success) {
            await ref.read(wifiSetForceUsageUseCaseProvider).execute(true);
            _updateState(
              (s) => s.copyWith(
                selectedDeviceId: ssid.replaceAll("_Setup", ""),
                selectedSsid: ssid,
                currentStep: WifiSetupStep.selectTargetWifi,
                isProcessing: false,
                scanResults: [],
              ),
            );
            await getTargetWifiNetworks();
          } else {
            _updateState(
              (s) => s.copyWith(isProcessing: false, stepError: "기기 연결 실패"),
            );
          }
        case Failure(exception: final e):
          _updateState(
            (s) =>
                s.copyWith(isProcessing: false, stepError: e.readableMessage),
          );
      }
    } catch (e) {
      _updateState(
        (s) => s.copyWith(isProcessing: false, stepError: "연결 중 오류 발생"),
      );
    }
  }

  Future<void> getTargetWifiNetworks() async {
    _updateState((s) => s.copyWith(isScanning: true, stepError: null));
    try {
      final result = await ref.read(getWifiNetworksUseCaseProvider).execute();
      if (!ref.mounted) return;
      switch (result) {
        case Success<List<WifiNetwork>>(data: final networks):
          _updateState(
            (s) => s.copyWith(scanResults: networks, isScanning: false),
          );
        case Failure(exception: final _):
          _updateState(
            (s) => s.copyWith(isScanning: false, stepError: "WiFi 조회 실패"),
          );
      }
    } catch (e) {
      _updateState(
        (s) => s.copyWith(isScanning: false, stepError: "WiFi 조회 실패"),
      );
    }
  }

  void onTargetWifiSelected(
    WifiNetwork network, {
    required Function(String ssid) onRequirePassword,
  }) {
    _updateState((s) => s.copyWith(selectedSsid: network.ssid));
    if (network.isSecure) {
      onRequirePassword(network.ssid);
    } else {
      completeSetup("");
    }
  }

  void cancelProcessing() {
    _isCancelled = true;
    _updateState(
      (s) => s.copyWith(isProcessing: false, stepError: "사용자에 의해 중단되었습니다."),
    );
  }

  Future<void> completeSetup(String password) async {
    _isCancelled = false;
    _updateState(
      (s) => s.copyWith(
        isProcessing: true,
        loadingMessage: "설정 정보를 기기에 전송하고 있습니다...",
        stepError: null,
      ),
    );

    try {
      final config = WifiConfig(
        deviceId: state.value!.selectedDeviceId,
        ssid: state.value!.selectedSsid,
        password: password,
      );
      final result = await ref
          .read(sendWifiCredentialsUseCaseProvider)
          .execute(config);
      if (!ref.mounted || _isCancelled) return;

      if (result is Failure) {
        _updateState(
          (s) => s.copyWith(
            isProcessing: false,
            stepError: result.exception.readableMessage,
          ),
        );
        return;
      }

      _updateState(
        (s) => s.copyWith(loadingMessage: "기기가 WiFi에 연결되는지 확인 중입니다..."),
      );
      bool isDeviceConnected = false;
      String? assignedIp;

      for (int i = 0; i < 10; i++) {
        if (_isCancelled) return;
        await Future.delayed(const Duration(seconds: 2));
        if (_isCancelled) return;

        final statusResult = await ref
            .read(checkWifiStatusUseCaseProvider)
            .execute();
        if (statusResult is Success<String?> && statusResult.data != null) {
          isDeviceConnected = true;
          assignedIp = statusResult.data;
          break;
        }
      }

      if (_isCancelled) return;

      if (!isDeviceConnected) {
        _updateState(
          (s) => s.copyWith(
            isProcessing: false,
            stepError: "기기가 WiFi 연결에 실패했습니다.",
          ),
        );
        return;
      }

      _updateState(
        (s) => s.copyWith(loadingMessage: "연결 성공! 네트워크를 복구하고 있습니다..."),
      );
      await ref.read(networkServiceProvider).waitForInternet();
      await ref.read(wifiSetForceUsageUseCaseProvider).execute(false);
      await ref.read(wifiDisconnectFromDeviceUseCaseProvider).execute();

      await ref
          .read(savedDeviceInfoProvider.notifier)
          .save(
            ssid: state.value!.selectedSsid,
            deviceIp: assignedIp,
            deviceId: state.value!.selectedDeviceId,
          );

      _updateState(
        (s) =>
            s.copyWith(currentStep: WifiSetupStep.success, isProcessing: false),
      );
    } catch (e) {
      if (!_isCancelled) {
        _updateState(
          (s) => s.copyWith(isProcessing: false, stepError: "전송 오류"),
        );
      }
    }
  }

  Future<void> resetAndRestart() async {
    _updateState(
      (s) => s.copyWith(
        isProcessing: true,
        loadingMessage: "기기 연결 정보를 초기화하고 있습니다...",
      ),
    );
    try {
      String targetIp = "192.168.4.1";
      final savedInfo = ref.read(savedDeviceInfoProvider).value;
      if (state.value!.currentStep == WifiSetupStep.success &&
          savedInfo?.deviceIp != null) {
        targetIp = savedInfo!.deviceIp!;
      }
      await ref.read(resetWifiDeviceUseCaseProvider).execute(targetIp);
      await Future.delayed(const Duration(milliseconds: 800));
      await resetSession();
      _updateState(
        (s) => const WifiSetupState(currentStep: WifiSetupStep.guidelines),
      );
    } catch (e) {
      await resetSession();
    }
  }

  Future<void> resetSession() async {
    state = const AsyncLoading();
    await _restoreNetworkQuietly();
    state = const AsyncData(WifiSetupState());
  }

  void backToStep(WifiSetupStep step) =>
      _updateState((s) => s.copyWith(currentStep: step, stepError: null));

  Future<bool> _ensureLocationAndGps() async {
    var status = await Permission.location.status;
    if (status.isDenied) status = await Permission.location.request();
    return status.isGranted &&
        await ref.read(gpsServiceProvider).ensureGpsEnabled();
  }
}
