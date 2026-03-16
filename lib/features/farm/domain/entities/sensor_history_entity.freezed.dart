// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SensorHistory {

 DateTime get timestamp; double get temperature; double get humidity;
/// Create a copy of SensorHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorHistoryCopyWith<SensorHistory> get copyWith => _$SensorHistoryCopyWithImpl<SensorHistory>(this as SensorHistory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorHistory&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,temperature,humidity);

@override
String toString() {
  return 'SensorHistory(timestamp: $timestamp, temperature: $temperature, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class $SensorHistoryCopyWith<$Res>  {
  factory $SensorHistoryCopyWith(SensorHistory value, $Res Function(SensorHistory) _then) = _$SensorHistoryCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, double temperature, double humidity
});




}
/// @nodoc
class _$SensorHistoryCopyWithImpl<$Res>
    implements $SensorHistoryCopyWith<$Res> {
  _$SensorHistoryCopyWithImpl(this._self, this._then);

  final SensorHistory _self;
  final $Res Function(SensorHistory) _then;

/// Create a copy of SensorHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? temperature = null,Object? humidity = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorHistory].
extension SensorHistoryPatterns on SensorHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorHistory value)  $default,){
final _that = this;
switch (_that) {
case _SensorHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorHistory value)?  $default,){
final _that = this;
switch (_that) {
case _SensorHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  double temperature,  double humidity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorHistory() when $default != null:
return $default(_that.timestamp,_that.temperature,_that.humidity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  double temperature,  double humidity)  $default,) {final _that = this;
switch (_that) {
case _SensorHistory():
return $default(_that.timestamp,_that.temperature,_that.humidity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  double temperature,  double humidity)?  $default,) {final _that = this;
switch (_that) {
case _SensorHistory() when $default != null:
return $default(_that.timestamp,_that.temperature,_that.humidity);case _:
  return null;

}
}

}

/// @nodoc


class _SensorHistory implements SensorHistory {
  const _SensorHistory({required this.timestamp, required this.temperature, required this.humidity});
  

@override final  DateTime timestamp;
@override final  double temperature;
@override final  double humidity;

/// Create a copy of SensorHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorHistoryCopyWith<_SensorHistory> get copyWith => __$SensorHistoryCopyWithImpl<_SensorHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorHistory&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp,temperature,humidity);

@override
String toString() {
  return 'SensorHistory(timestamp: $timestamp, temperature: $temperature, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class _$SensorHistoryCopyWith<$Res> implements $SensorHistoryCopyWith<$Res> {
  factory _$SensorHistoryCopyWith(_SensorHistory value, $Res Function(_SensorHistory) _then) = __$SensorHistoryCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, double temperature, double humidity
});




}
/// @nodoc
class __$SensorHistoryCopyWithImpl<$Res>
    implements _$SensorHistoryCopyWith<$Res> {
  __$SensorHistoryCopyWithImpl(this._self, this._then);

  final _SensorHistory _self;
  final $Res Function(_SensorHistory) _then;

/// Create a copy of SensorHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? temperature = null,Object? humidity = null,}) {
  return _then(_SensorHistory(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
