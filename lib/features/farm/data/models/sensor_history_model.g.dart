// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorHistoryModel _$SensorHistoryModelFromJson(Map<String, dynamic> json) =>
    _SensorHistoryModel(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$SensorHistoryModelToJson(_SensorHistoryModel instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'timestamp': instance.timestamp,
    };
