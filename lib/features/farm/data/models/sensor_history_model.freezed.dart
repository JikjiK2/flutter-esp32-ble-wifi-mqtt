// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorHistoryModel {

@JsonKey(name: 'temperature') double get temperature;@JsonKey(name: 'humidity') double get humidity; String get timestamp;
/// Create a copy of SensorHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorHistoryModelCopyWith<SensorHistoryModel> get copyWith => _$SensorHistoryModelCopyWithImpl<SensorHistoryModel>(this as SensorHistoryModel, _$identity);

  /// Serializes this SensorHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorHistoryModel&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,humidity,timestamp);

@override
String toString() {
  return 'SensorHistoryModel(temperature: $temperature, humidity: $humidity, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SensorHistoryModelCopyWith<$Res>  {
  factory $SensorHistoryModelCopyWith(SensorHistoryModel value, $Res Function(SensorHistoryModel) _then) = _$SensorHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'temperature') double temperature,@JsonKey(name: 'humidity') double humidity, String timestamp
});




}
/// @nodoc
class _$SensorHistoryModelCopyWithImpl<$Res>
    implements $SensorHistoryModelCopyWith<$Res> {
  _$SensorHistoryModelCopyWithImpl(this._self, this._then);

  final SensorHistoryModel _self;
  final $Res Function(SensorHistoryModel) _then;

/// Create a copy of SensorHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temperature = null,Object? humidity = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorHistoryModel].
extension SensorHistoryModelPatterns on SensorHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _SensorHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SensorHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temperature')  double temperature, @JsonKey(name: 'humidity')  double humidity,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorHistoryModel() when $default != null:
return $default(_that.temperature,_that.humidity,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temperature')  double temperature, @JsonKey(name: 'humidity')  double humidity,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _SensorHistoryModel():
return $default(_that.temperature,_that.humidity,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temperature')  double temperature, @JsonKey(name: 'humidity')  double humidity,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SensorHistoryModel() when $default != null:
return $default(_that.temperature,_that.humidity,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SensorHistoryModel extends SensorHistoryModel {
  const _SensorHistoryModel({@JsonKey(name: 'temperature') required this.temperature, @JsonKey(name: 'humidity') required this.humidity, required this.timestamp}): super._();
  factory _SensorHistoryModel.fromJson(Map<String, dynamic> json) => _$SensorHistoryModelFromJson(json);

@override@JsonKey(name: 'temperature') final  double temperature;
@override@JsonKey(name: 'humidity') final  double humidity;
@override final  String timestamp;

/// Create a copy of SensorHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorHistoryModelCopyWith<_SensorHistoryModel> get copyWith => __$SensorHistoryModelCopyWithImpl<_SensorHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorHistoryModel&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,humidity,timestamp);

@override
String toString() {
  return 'SensorHistoryModel(temperature: $temperature, humidity: $humidity, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SensorHistoryModelCopyWith<$Res> implements $SensorHistoryModelCopyWith<$Res> {
  factory _$SensorHistoryModelCopyWith(_SensorHistoryModel value, $Res Function(_SensorHistoryModel) _then) = __$SensorHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'temperature') double temperature,@JsonKey(name: 'humidity') double humidity, String timestamp
});




}
/// @nodoc
class __$SensorHistoryModelCopyWithImpl<$Res>
    implements _$SensorHistoryModelCopyWith<$Res> {
  __$SensorHistoryModelCopyWithImpl(this._self, this._then);

  final _SensorHistoryModel _self;
  final $Res Function(_SensorHistoryModel) _then;

/// Create a copy of SensorHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temperature = null,Object? humidity = null,Object? timestamp = null,}) {
  return _then(_SensorHistoryModel(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
