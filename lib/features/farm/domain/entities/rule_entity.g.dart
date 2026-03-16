// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RuleEntity _$RuleEntityFromJson(Map<String, dynamic> json) => _RuleEntity(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  deviceId: json['device_id'] as String,
  sensorType: json['sensor_type'] as String,
  condition: json['condition'] as String,
  threshold: (json['threshold'] as num).toDouble(),
  actionCommand: json['action_command'] as String,
  actionPayload: json['action_payload'] as Map<String, dynamic>? ?? const {},
  isActive: json['is_active'] as bool? ?? true,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$RuleEntityToJson(_RuleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'device_id': instance.deviceId,
      'sensor_type': instance.sensorType,
      'condition': instance.condition,
      'threshold': instance.threshold,
      'action_command': instance.actionCommand,
      'action_payload': instance.actionPayload,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
