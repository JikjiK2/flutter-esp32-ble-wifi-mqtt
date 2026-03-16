import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';

part 'mqtt_setup_form_provider.freezed.dart';

part 'mqtt_setup_form_provider.g.dart';

@freezed
sealed class MqttSetupFormData with _$MqttSetupFormData {
  const factory MqttSetupFormData({
    @Default('') String deviceName,
    @Default('') String selectedSsid,
    @Default('') String wifiPassword,
    @Default('') String mqttIp,
    @Default('') String selectedDeviceId,
  }) = _MqttSetupFormData;
}

@riverpod
class MqttSetupForm extends _$MqttSetupForm {
  @override
  MqttSetupFormData build() {
    return MqttSetupFormData(mqttIp: AppConstants.mqttHost);
  }

  void update({
    String? deviceName,
    String? selectedSsid,
    String? wifiPassword,
    String? mqttIp,
    String? selectedDeviceId,
  }) {
    state = state.copyWith(
      deviceName: deviceName ?? state.deviceName,
      selectedSsid: selectedSsid ?? state.selectedSsid,
      wifiPassword: wifiPassword ?? state.wifiPassword,
      mqttIp: mqttIp ?? state.mqttIp,
      selectedDeviceId: selectedDeviceId ?? state.selectedDeviceId,
    );
  }

  void reset() {
    state = MqttSetupFormData(mqttIp: AppConstants.mqttHost);
  }
}
