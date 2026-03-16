import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule_entity.freezed.dart';

part 'rule_entity.g.dart';

@freezed
sealed class RuleEntity with _$RuleEntity {
  const factory RuleEntity({
    int? id,
    required String name,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'sensor_type') required String sensorType,
    required String condition,
    required double threshold,
    @JsonKey(name: 'action_command') required String actionCommand,
    @JsonKey(name: 'action_payload')
    @Default({})
    Map<String, dynamic> actionPayload,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _RuleEntity;

  factory RuleEntity.fromJson(Map<String, dynamic> json) =>
      _$RuleEntityFromJson(json);
}
