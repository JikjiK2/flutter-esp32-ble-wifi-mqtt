import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_device_entity.freezed.dart';

enum BleAdapterState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off,
}

enum BleDeviceConnectionState {
  disconnected,
  connecting,
  connected,
  disconnecting,
}

@freezed
sealed class BleDevice with _$BleDevice {
  const factory BleDevice({
    required String id,
    required String name,
    @Default(-100) int rssi,
  }) = _BleDevice;
}
