// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorDataModel _$SensorDataModelFromJson(Map<String, dynamic> json) =>
    _SensorDataModel(
      deviceId: json['device_id'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$SensorDataModelToJson(_SensorDataModel instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'timestamp': instance.timestamp,
    };
