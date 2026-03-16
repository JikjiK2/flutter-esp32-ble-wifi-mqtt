import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';

part 'sensor_data_model.freezed.dart';

part 'sensor_data_model.g.dart';

@freezed
sealed class SensorDataModel with _$SensorDataModel {
  const SensorDataModel._();

  const factory SensorDataModel({
    @JsonKey(name: 'device_id') required String deviceId,
    required double temperature,
    required double humidity,
    required String timestamp,
  }) = _SensorDataModel;

  factory SensorDataModel.fromJson(Map<String, dynamic> json) =>
      _$SensorDataModelFromJson(json);

  SensorHistory toEntity() {
    return SensorHistory(
      timestamp: DateTime.parse(timestamp),
      temperature: temperature,
      humidity: humidity,
    );
  }
}
