import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';

part 'sensor_history_model.freezed.dart';

part 'sensor_history_model.g.dart';

@freezed
sealed class SensorHistoryModel with _$SensorHistoryModel {
  const SensorHistoryModel._();

  const factory SensorHistoryModel({
    @JsonKey(name: 'temperature') required double temperature,
    @JsonKey(name: 'humidity') required double humidity,
    required String timestamp,
  }) = _SensorHistoryModel;

  factory SensorHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SensorHistoryModelFromJson(json);

  SensorHistory toEntity() {
    String ts = timestamp;
    if (!ts.endsWith('Z') && !ts.contains('+')) {
      ts += 'Z';
    }

    return SensorHistory(
      temperature: temperature,
      humidity: humidity,
      timestamp: DateTime.parse(ts).toLocal(),
    );
  }
}
