// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LampStatus {

 String get deviceId; bool get isOn; int get brightness; int get color; int get ledMode; int get brightMode; double get temperature; double get humidity; int get rssi; DateTime? get timestamp;
/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LampStatusCopyWith<LampStatus> get copyWith => _$LampStatusCopyWithImpl<LampStatus>(this as LampStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LampStatus&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.color, color) || other.color == color)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,isOn,brightness,color,ledMode,brightMode,temperature,humidity,rssi,timestamp);

@override
String toString() {
  return 'LampStatus(deviceId: $deviceId, isOn: $isOn, brightness: $brightness, color: $color, ledMode: $ledMode, brightMode: $brightMode, temperature: $temperature, humidity: $humidity, rssi: $rssi, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $LampStatusCopyWith<$Res>  {
  factory $LampStatusCopyWith(LampStatus value, $Res Function(LampStatus) _then) = _$LampStatusCopyWithImpl;
@useResult
$Res call({
 String deviceId, bool isOn, int brightness, int color, int ledMode, int brightMode, double temperature, double humidity, int rssi, DateTime? timestamp
});




}
/// @nodoc
class _$LampStatusCopyWithImpl<$Res>
    implements $LampStatusCopyWith<$Res> {
  _$LampStatusCopyWithImpl(this._self, this._then);

  final LampStatus _self;
  final $Res Function(LampStatus) _then;

/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? isOn = null,Object? brightness = null,Object? color = null,Object? ledMode = null,Object? brightMode = null,Object? temperature = null,Object? humidity = null,Object? rssi = null,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,ledMode: null == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int,brightMode: null == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LampStatus].
extension LampStatusPatterns on LampStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LampStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LampStatus value)  $default,){
final _that = this;
switch (_that) {
case _LampStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LampStatus value)?  $default,){
final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  bool isOn,  int brightness,  int color,  int ledMode,  int brightMode,  double temperature,  double humidity,  int rssi,  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
return $default(_that.deviceId,_that.isOn,_that.brightness,_that.color,_that.ledMode,_that.brightMode,_that.temperature,_that.humidity,_that.rssi,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  bool isOn,  int brightness,  int color,  int ledMode,  int brightMode,  double temperature,  double humidity,  int rssi,  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _LampStatus():
return $default(_that.deviceId,_that.isOn,_that.brightness,_that.color,_that.ledMode,_that.brightMode,_that.temperature,_that.humidity,_that.rssi,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  bool isOn,  int brightness,  int color,  int ledMode,  int brightMode,  double temperature,  double humidity,  int rssi,  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
return $default(_that.deviceId,_that.isOn,_that.brightness,_that.color,_that.ledMode,_that.brightMode,_that.temperature,_that.humidity,_that.rssi,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _LampStatus implements LampStatus {
  const _LampStatus({this.deviceId = "N/A", this.isOn = true, this.brightness = 128, this.color = 0xFFFFFF, this.ledMode = 0, this.brightMode = 0, this.temperature = 0.0, this.humidity = 0.0, this.rssi = -100, this.timestamp});
  

@override@JsonKey() final  String deviceId;
@override@JsonKey() final  bool isOn;
@override@JsonKey() final  int brightness;
@override@JsonKey() final  int color;
@override@JsonKey() final  int ledMode;
@override@JsonKey() final  int brightMode;
@override@JsonKey() final  double temperature;
@override@JsonKey() final  double humidity;
@override@JsonKey() final  int rssi;
@override final  DateTime? timestamp;

/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LampStatusCopyWith<_LampStatus> get copyWith => __$LampStatusCopyWithImpl<_LampStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LampStatus&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.color, color) || other.color == color)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,isOn,brightness,color,ledMode,brightMode,temperature,humidity,rssi,timestamp);

@override
String toString() {
  return 'LampStatus(deviceId: $deviceId, isOn: $isOn, brightness: $brightness, color: $color, ledMode: $ledMode, brightMode: $brightMode, temperature: $temperature, humidity: $humidity, rssi: $rssi, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$LampStatusCopyWith<$Res> implements $LampStatusCopyWith<$Res> {
  factory _$LampStatusCopyWith(_LampStatus value, $Res Function(_LampStatus) _then) = __$LampStatusCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, bool isOn, int brightness, int color, int ledMode, int brightMode, double temperature, double humidity, int rssi, DateTime? timestamp
});




}
/// @nodoc
class __$LampStatusCopyWithImpl<$Res>
    implements _$LampStatusCopyWith<$Res> {
  __$LampStatusCopyWithImpl(this._self, this._then);

  final _LampStatus _self;
  final $Res Function(_LampStatus) _then;

/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? isOn = null,Object? brightness = null,Object? color = null,Object? ledMode = null,Object? brightMode = null,Object? temperature = null,Object? humidity = null,Object? rssi = null,Object? timestamp = freezed,}) {
  return _then(_LampStatus(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,isOn: null == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,ledMode: null == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int,brightMode: null == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
