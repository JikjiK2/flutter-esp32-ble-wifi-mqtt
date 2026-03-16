// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_config_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WifiConfig _$WifiConfigFromJson(Map<String, dynamic> json) => _WifiConfig(
  deviceId: json['deviceId'] as String,
  ssid: json['ssid'] as String,
  password: json['password'] as String,
  apPw: json['apPw'] as String?,
);

Map<String, dynamic> _$WifiConfigToJson(_WifiConfig instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'ssid': instance.ssid,
      'password': instance.password,
      'apPw': instance.apPw,
    };
