import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/usecases/mqtt_usecases.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_providers.dart';

part 'mqtt_usecase_providers.g.dart';

@riverpod
MqttDeviceDiscoveryUseCase mqttDeviceDiscoveryUseCase(Ref ref) {
  return MqttDeviceDiscoveryUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
MqttConnectToDeviceUseCase mqttConnectToDeviceUseCase(Ref ref) {
  return MqttConnectToDeviceUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
MqttDisconnectFromDeviceUseCase mqttDisconnectFromDeviceUseCase(Ref ref) {
  return MqttDisconnectFromDeviceUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
MqttSetForceWifiUseCase mqttSetForceWifiUseCase(Ref ref) {
  return MqttSetForceWifiUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
CheckMqttWifiStatusUseCase checkMqttWifiStatusUseCase(Ref ref) {
  return CheckMqttWifiStatusUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
MqttSendConfigUseCase mqttSendConfigUseCase(Ref ref) {
  return MqttSendConfigUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
WifiReconfigureRemoteUseCase wifiReconfigureRemoteUseCase(Ref ref) {
  return WifiReconfigureRemoteUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
RemoteWifiScanUseCase remoteWifiScanUseCase(Ref ref) {
  return RemoteWifiScanUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
MqttPublishRawUseCase mqttPublishRawUseCase(Ref ref) {
  return MqttPublishRawUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
MqttFinalizeSetupUseCase mqttFinalizeSetupUseCase(Ref ref) {
  return MqttFinalizeSetupUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
GetMqttAvailableNetworksUseCase getMqttAvailableNetworksUseCase(Ref ref) {
  return GetMqttAvailableNetworksUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
CheckMqttConnectionStatusUseCase checkMqttConnectionStatusUseCase(Ref ref) {
  return CheckMqttConnectionStatusUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
WatchMqttLogUseCase watchMqttLogUseCase(Ref ref) {
  return WatchMqttLogUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
ConnectMqttUseCase connectMqttUseCase(Ref ref) {
  return ConnectMqttUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
DisconnectMqttUseCase disconnectMqttUseCase(Ref ref) {
  return DisconnectMqttUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
SendMqttCommandUseCase sendMqttCommandUseCase(Ref ref) {
  return SendMqttCommandUseCase(ref.watch(mqttRepositoryProvider));
}

@riverpod
ResetMqttDeviceUseCase resetMqttDeviceUseCase(Ref ref) {
  return ResetMqttDeviceUseCase(ref.watch(mqttRepositoryProvider));
}
