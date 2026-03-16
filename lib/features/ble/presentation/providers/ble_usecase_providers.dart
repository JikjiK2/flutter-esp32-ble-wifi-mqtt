import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/usecases/ble_usecases.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_usecase_providers.g.dart';

@riverpod
TurnOnBluetoothUseCase turnOnBluetoothUseCase(Ref ref) {
  return TurnOnBluetoothUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
StartDeviceScanUseCase startDeviceScanUseCase(Ref ref) {
  return StartDeviceScanUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
StopDeviceScanUseCase stopDeviceScanUseCase(Ref ref) {
  return StopDeviceScanUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
ConnectDeviceUseCase connectDeviceUseCase(Ref ref) {
  return ConnectDeviceUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
DisconnectDeviceUseCase disconnectDeviceUseCase(Ref ref) {
  return DisconnectDeviceUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
SendLampStatusUseCase sendLampStatusUseCase(Ref ref) {
  return SendLampStatusUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
RequestBleSyncUseCase requestBleSyncUseCase(Ref ref) {
  return RequestBleSyncUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
WatchBleStatusUseCase watchBleStatusUseCase(Ref ref) {
  return WatchBleStatusUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
WatchBleRssiUseCase watchBleRssiUseCase(Ref ref) {
  return WatchBleRssiUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
WatchBleLogUseCase watchBleLogUseCase(Ref ref) {
  return WatchBleLogUseCase(ref.watch(bleRepositoryProvider));
}

@riverpod
Stream<LampStatus> bleStatusStream(Ref ref, String macId) {
  return ref.watch(watchBleStatusUseCaseProvider).execute(macId);
}

@riverpod
Stream<int> bleRssiStream(Ref ref, String macId) {
  return ref.watch(watchBleRssiUseCaseProvider).execute(macId);
}
