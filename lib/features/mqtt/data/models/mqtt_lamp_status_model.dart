import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';

part 'mqtt_lamp_status_model.freezed.dart';

part 'mqtt_lamp_status_model.g.dart';

@freezed
sealed class MqttLampStatusModel with _$MqttLampStatusModel {
  const MqttLampStatusModel._();

  const factory MqttLampStatusModel({
    @JsonKey(name: 'temp') dynamic temp,
    @JsonKey(name: 'hum') dynamic hum,
    @JsonKey(name: 'isOn') bool? isOn,
    @JsonKey(name: 'brightness') int? brightness,
    @JsonKey(name: 'ledMode') int? ledMode,
    @JsonKey(name: 'brightMode') int? brightMode,
    @JsonKey(name: 'r') int? r,
    @JsonKey(name: 'g') int? g,
    @JsonKey(name: 'b') int? b,
    @JsonKey(name: 'rssi') int? rssi,
  }) = _MqttLampStatusModel;

  factory MqttLampStatusModel.fromJson(Map<String, dynamic> json) =>
      _$MqttLampStatusModelFromJson(json);

  LampStatus toEntity(String deviceId) {
    return LampStatus(
      deviceId: deviceId,
      isOn: isOn ?? true,
      brightness: brightness ?? 128,
      color: (r != null && g != null && b != null)
          ? (r! << 16 | g! << 8 | b!)
          : 0xFFFFFF,
      ledMode: ledMode ?? 0,
      brightMode: brightMode ?? 0,
      temperature: (temp is num) ? temp.toDouble() : 0.0,
      humidity: (hum is num) ? hum.toDouble() : 0.0,
      rssi: rssi ?? -100,
      timestamp: DateTime.now(),
    );
  }
}
