import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/usecases/wifi_usecases.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_providers.dart';

part 'wifi_usecase_providers.g.dart';

@riverpod
DiscoverWifiDeviceUseCase discoverWifiDeviceUseCase(Ref ref) {
  return DiscoverWifiDeviceUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
GetWifiDevicesUseCase getWifiDevicesUseCase(Ref ref) {
  return GetWifiDevicesUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
WifiConnectToDeviceUseCase wifiConnectToDeviceUseCase(Ref ref) {
  return WifiConnectToDeviceUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
WifiDisconnectFromDeviceUseCase wifiDisconnectFromDeviceUseCase(Ref ref) {
  return WifiDisconnectFromDeviceUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
WifiSetForceUsageUseCase wifiSetForceUsageUseCase(Ref ref) {
  return WifiSetForceUsageUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
GetWifiNetworksUseCase getWifiNetworksUseCase(Ref ref) {
  return GetWifiNetworksUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
SendWifiCredentialsUseCase sendWifiCredentialsUseCase(Ref ref) {
  return SendWifiCredentialsUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
SendWifiCommandUseCase sendWifiCommandUseCase(Ref ref) {
  return SendWifiCommandUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
ResetWifiDeviceUseCase resetWifiDeviceUseCase(Ref ref) {
  return ResetWifiDeviceUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
CheckWifiStatusUseCase checkWifiStatusUseCase(Ref ref) {
  return CheckWifiStatusUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
ConnectWifiControlUseCase connectWifiControlUseCase(Ref ref) {
  return ConnectWifiControlUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
DisconnectWifiControlUseCase disconnectWifiControlUseCase(Ref ref) {
  return DisconnectWifiControlUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
WatchWifiLogUseCase watchWifiLogUseCase(Ref ref) {
  return WatchWifiLogUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
WatchWifiStatusUseCase watchWifiStatusUseCase(Ref ref) {
  return WatchWifiStatusUseCase(ref.watch(wifiRepositoryProvider));
}

@riverpod
Stream<LampStatus> wifiStatusStream(Ref ref) {
  return ref.watch(watchWifiStatusUseCaseProvider).execute();
}
