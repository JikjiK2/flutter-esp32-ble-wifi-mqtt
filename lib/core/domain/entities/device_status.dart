import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_status.freezed.dart';

enum ConnectionStatus { disconnected, connecting, connected, error }

@freezed
sealed class LampStatus with _$LampStatus {
  const factory LampStatus({
    @Default("N/A") String deviceId,
    @Default(true) bool isOn,
    @Default(128) int brightness,
    @Default(0xFFFFFF) int color,
    @Default(0) int ledMode,
    @Default(0) int brightMode,
    @Default(0.0) double temperature,
    @Default(0.0) double humidity,
    @Default(-100) int rssi,
    DateTime? timestamp,
  }) = _LampStatus;

  factory LampStatus.initial() => const LampStatus();
}
