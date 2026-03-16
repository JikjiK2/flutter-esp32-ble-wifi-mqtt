// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RuleEntity {

 int? get id; String get name;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'sensor_type') String get sensorType; String get condition; double get threshold;@JsonKey(name: 'action_command') String get actionCommand;@JsonKey(name: 'action_payload') Map<String, dynamic> get actionPayload;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleEntityCopyWith<RuleEntity> get copyWith => _$RuleEntityCopyWithImpl<RuleEntity>(this as RuleEntity, _$identity);

  /// Serializes this RuleEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.sensorType, sensorType) || other.sensorType == sensorType)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.actionCommand, actionCommand) || other.actionCommand == actionCommand)&&const DeepCollectionEquality().equals(other.actionPayload, actionPayload)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,deviceId,sensorType,condition,threshold,actionCommand,const DeepCollectionEquality().hash(actionPayload),isActive,createdAt,updatedAt);

@override
String toString() {
  return 'RuleEntity(id: $id, name: $name, deviceId: $deviceId, sensorType: $sensorType, condition: $condition, threshold: $threshold, actionCommand: $actionCommand, actionPayload: $actionPayload, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RuleEntityCopyWith<$Res>  {
  factory $RuleEntityCopyWith(RuleEntity value, $Res Function(RuleEntity) _then) = _$RuleEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String name,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'sensor_type') String sensorType, String condition, double threshold,@JsonKey(name: 'action_command') String actionCommand,@JsonKey(name: 'action_payload') Map<String, dynamic> actionPayload,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$RuleEntityCopyWithImpl<$Res>
    implements $RuleEntityCopyWith<$Res> {
  _$RuleEntityCopyWithImpl(this._self, this._then);

  final RuleEntity _self;
  final $Res Function(RuleEntity) _then;

/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? deviceId = null,Object? sensorType = null,Object? condition = null,Object? threshold = null,Object? actionCommand = null,Object? actionPayload = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,sensorType: null == sensorType ? _self.sensorType : sensorType // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,actionCommand: null == actionCommand ? _self.actionCommand : actionCommand // ignore: cast_nullable_to_non_nullable
as String,actionPayload: null == actionPayload ? _self.actionPayload : actionPayload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleEntity].
extension RuleEntityPatterns on RuleEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleEntity value)  $default,){
final _that = this;
switch (_that) {
case _RuleEntity():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'sensor_type')  String sensorType,  String condition,  double threshold, @JsonKey(name: 'action_command')  String actionCommand, @JsonKey(name: 'action_payload')  Map<String, dynamic> actionPayload, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
return $default(_that.id,_that.name,_that.deviceId,_that.sensorType,_that.condition,_that.threshold,_that.actionCommand,_that.actionPayload,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'sensor_type')  String sensorType,  String condition,  double threshold, @JsonKey(name: 'action_command')  String actionCommand, @JsonKey(name: 'action_payload')  Map<String, dynamic> actionPayload, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RuleEntity():
return $default(_that.id,_that.name,_that.deviceId,_that.sensorType,_that.condition,_that.threshold,_that.actionCommand,_that.actionPayload,_that.isActive,_that.createdAt,_that.updatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'sensor_type')  String sensorType,  String condition,  double threshold, @JsonKey(name: 'action_command')  String actionCommand, @JsonKey(name: 'action_payload')  Map<String, dynamic> actionPayload, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
return $default(_that.id,_that.name,_that.deviceId,_that.sensorType,_that.condition,_that.threshold,_that.actionCommand,_that.actionPayload,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleEntity implements RuleEntity {
  const _RuleEntity({this.id, required this.name, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'sensor_type') required this.sensorType, required this.condition, required this.threshold, @JsonKey(name: 'action_command') required this.actionCommand, @JsonKey(name: 'action_payload') final  Map<String, dynamic> actionPayload = const {}, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _actionPayload = actionPayload;
  factory _RuleEntity.fromJson(Map<String, dynamic> json) => _$RuleEntityFromJson(json);

@override final  int? id;
@override final  String name;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'sensor_type') final  String sensorType;
@override final  String condition;
@override final  double threshold;
@override@JsonKey(name: 'action_command') final  String actionCommand;
 final  Map<String, dynamic> _actionPayload;
@override@JsonKey(name: 'action_payload') Map<String, dynamic> get actionPayload {
  if (_actionPayload is EqualUnmodifiableMapView) return _actionPayload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_actionPayload);
}

@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleEntityCopyWith<_RuleEntity> get copyWith => __$RuleEntityCopyWithImpl<_RuleEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.sensorType, sensorType) || other.sensorType == sensorType)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.actionCommand, actionCommand) || other.actionCommand == actionCommand)&&const DeepCollectionEquality().equals(other._actionPayload, _actionPayload)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,deviceId,sensorType,condition,threshold,actionCommand,const DeepCollectionEquality().hash(_actionPayload),isActive,createdAt,updatedAt);

@override
String toString() {
  return 'RuleEntity(id: $id, name: $name, deviceId: $deviceId, sensorType: $sensorType, condition: $condition, threshold: $threshold, actionCommand: $actionCommand, actionPayload: $actionPayload, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RuleEntityCopyWith<$Res> implements $RuleEntityCopyWith<$Res> {
  factory _$RuleEntityCopyWith(_RuleEntity value, $Res Function(_RuleEntity) _then) = __$RuleEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'sensor_type') String sensorType, String condition, double threshold,@JsonKey(name: 'action_command') String actionCommand,@JsonKey(name: 'action_payload') Map<String, dynamic> actionPayload,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$RuleEntityCopyWithImpl<$Res>
    implements _$RuleEntityCopyWith<$Res> {
  __$RuleEntityCopyWithImpl(this._self, this._then);

  final _RuleEntity _self;
  final $Res Function(_RuleEntity) _then;

/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? deviceId = null,Object? sensorType = null,Object? condition = null,Object? threshold = null,Object? actionCommand = null,Object? actionPayload = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RuleEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,sensorType: null == sensorType ? _self.sensorType : sensorType // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,actionCommand: null == actionCommand ? _self.actionCommand : actionCommand // ignore: cast_nullable_to_non_nullable
as String,actionPayload: null == actionPayload ? _self._actionPayload : actionPayload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
