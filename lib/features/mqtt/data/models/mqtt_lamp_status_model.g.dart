// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_lamp_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MqttLampStatusModel _$MqttLampStatusModelFromJson(Map<String, dynamic> json) =>
    _MqttLampStatusModel(
      temp: json['temp'],
      hum: json['hum'],
      isOn: json['isOn'] as bool?,
      brightness: (json['brightness'] as num?)?.toInt(),
      ledMode: (json['ledMode'] as num?)?.toInt(),
      brightMode: (json['brightMode'] as num?)?.toInt(),
      r: (json['r'] as num?)?.toInt(),
      g: (json['g'] as num?)?.toInt(),
      b: (json['b'] as num?)?.toInt(),
      rssi: (json['rssi'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MqttLampStatusModelToJson(
  _MqttLampStatusModel instance,
) => <String, dynamic>{
  'temp': instance.temp,
  'hum': instance.hum,
  'isOn': instance.isOn,
  'brightness': instance.brightness,
  'ledMode': instance.ledMode,
  'brightMode': instance.brightMode,
  'r': instance.r,
  'g': instance.g,
  'b': instance.b,
  'rssi': instance.rssi,
};
