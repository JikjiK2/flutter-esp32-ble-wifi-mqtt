// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_lamp_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MqttLampStatusModel {

@JsonKey(name: 'temp') dynamic get temp;@JsonKey(name: 'hum') dynamic get hum;@JsonKey(name: 'isOn') bool? get isOn;@JsonKey(name: 'brightness') int? get brightness;@JsonKey(name: 'ledMode') int? get ledMode;@JsonKey(name: 'brightMode') int? get brightMode;@JsonKey(name: 'r') int? get r;@JsonKey(name: 'g') int? get g;@JsonKey(name: 'b') int? get b;@JsonKey(name: 'rssi') int? get rssi;
/// Create a copy of MqttLampStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttLampStatusModelCopyWith<MqttLampStatusModel> get copyWith => _$MqttLampStatusModelCopyWithImpl<MqttLampStatusModel>(this as MqttLampStatusModel, _$identity);

  /// Serializes this MqttLampStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttLampStatusModel&&const DeepCollectionEquality().equals(other.temp, temp)&&const DeepCollectionEquality().equals(other.hum, hum)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.r, r) || other.r == r)&&(identical(other.g, g) || other.g == g)&&(identical(other.b, b) || other.b == b)&&(identical(other.rssi, rssi) || other.rssi == rssi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(temp),const DeepCollectionEquality().hash(hum),isOn,brightness,ledMode,brightMode,r,g,b,rssi);

@override
String toString() {
  return 'MqttLampStatusModel(temp: $temp, hum: $hum, isOn: $isOn, brightness: $brightness, ledMode: $ledMode, brightMode: $brightMode, r: $r, g: $g, b: $b, rssi: $rssi)';
}


}

/// @nodoc
abstract mixin class $MqttLampStatusModelCopyWith<$Res>  {
  factory $MqttLampStatusModelCopyWith(MqttLampStatusModel value, $Res Function(MqttLampStatusModel) _then) = _$MqttLampStatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'temp') dynamic temp,@JsonKey(name: 'hum') dynamic hum,@JsonKey(name: 'isOn') bool? isOn,@JsonKey(name: 'brightness') int? brightness,@JsonKey(name: 'ledMode') int? ledMode,@JsonKey(name: 'brightMode') int? brightMode,@JsonKey(name: 'r') int? r,@JsonKey(name: 'g') int? g,@JsonKey(name: 'b') int? b,@JsonKey(name: 'rssi') int? rssi
});




}
/// @nodoc
class _$MqttLampStatusModelCopyWithImpl<$Res>
    implements $MqttLampStatusModelCopyWith<$Res> {
  _$MqttLampStatusModelCopyWithImpl(this._self, this._then);

  final MqttLampStatusModel _self;
  final $Res Function(MqttLampStatusModel) _then;

/// Create a copy of MqttLampStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = freezed,Object? hum = freezed,Object? isOn = freezed,Object? brightness = freezed,Object? ledMode = freezed,Object? brightMode = freezed,Object? r = freezed,Object? g = freezed,Object? b = freezed,Object? rssi = freezed,}) {
  return _then(_self.copyWith(
temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as dynamic,hum: freezed == hum ? _self.hum : hum // ignore: cast_nullable_to_non_nullable
as dynamic,isOn: freezed == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int?,ledMode: freezed == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int?,brightMode: freezed == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int?,r: freezed == r ? _self.r : r // ignore: cast_nullable_to_non_nullable
as int?,g: freezed == g ? _self.g : g // ignore: cast_nullable_to_non_nullable
as int?,b: freezed == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as int?,rssi: freezed == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MqttLampStatusModel].
extension MqttLampStatusModelPatterns on MqttLampStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttLampStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttLampStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttLampStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _MqttLampStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttLampStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _MqttLampStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  dynamic temp, @JsonKey(name: 'hum')  dynamic hum, @JsonKey(name: 'isOn')  bool? isOn, @JsonKey(name: 'brightness')  int? brightness, @JsonKey(name: 'ledMode')  int? ledMode, @JsonKey(name: 'brightMode')  int? brightMode, @JsonKey(name: 'r')  int? r, @JsonKey(name: 'g')  int? g, @JsonKey(name: 'b')  int? b, @JsonKey(name: 'rssi')  int? rssi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttLampStatusModel() when $default != null:
return $default(_that.temp,_that.hum,_that.isOn,_that.brightness,_that.ledMode,_that.brightMode,_that.r,_that.g,_that.b,_that.rssi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  dynamic temp, @JsonKey(name: 'hum')  dynamic hum, @JsonKey(name: 'isOn')  bool? isOn, @JsonKey(name: 'brightness')  int? brightness, @JsonKey(name: 'ledMode')  int? ledMode, @JsonKey(name: 'brightMode')  int? brightMode, @JsonKey(name: 'r')  int? r, @JsonKey(name: 'g')  int? g, @JsonKey(name: 'b')  int? b, @JsonKey(name: 'rssi')  int? rssi)  $default,) {final _that = this;
switch (_that) {
case _MqttLampStatusModel():
return $default(_that.temp,_that.hum,_that.isOn,_that.brightness,_that.ledMode,_that.brightMode,_that.r,_that.g,_that.b,_that.rssi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temp')  dynamic temp, @JsonKey(name: 'hum')  dynamic hum, @JsonKey(name: 'isOn')  bool? isOn, @JsonKey(name: 'brightness')  int? brightness, @JsonKey(name: 'ledMode')  int? ledMode, @JsonKey(name: 'brightMode')  int? brightMode, @JsonKey(name: 'r')  int? r, @JsonKey(name: 'g')  int? g, @JsonKey(name: 'b')  int? b, @JsonKey(name: 'rssi')  int? rssi)?  $default,) {final _that = this;
switch (_that) {
case _MqttLampStatusModel() when $default != null:
return $default(_that.temp,_that.hum,_that.isOn,_that.brightness,_that.ledMode,_that.brightMode,_that.r,_that.g,_that.b,_that.rssi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MqttLampStatusModel extends MqttLampStatusModel {
  const _MqttLampStatusModel({@JsonKey(name: 'temp') this.temp, @JsonKey(name: 'hum') this.hum, @JsonKey(name: 'isOn') this.isOn, @JsonKey(name: 'brightness') this.brightness, @JsonKey(name: 'ledMode') this.ledMode, @JsonKey(name: 'brightMode') this.brightMode, @JsonKey(name: 'r') this.r, @JsonKey(name: 'g') this.g, @JsonKey(name: 'b') this.b, @JsonKey(name: 'rssi') this.rssi}): super._();
  factory _MqttLampStatusModel.fromJson(Map<String, dynamic> json) => _$MqttLampStatusModelFromJson(json);

@override@JsonKey(name: 'temp') final  dynamic temp;
@override@JsonKey(name: 'hum') final  dynamic hum;
@override@JsonKey(name: 'isOn') final  bool? isOn;
@override@JsonKey(name: 'brightness') final  int? brightness;
@override@JsonKey(name: 'ledMode') final  int? ledMode;
@override@JsonKey(name: 'brightMode') final  int? brightMode;
@override@JsonKey(name: 'r') final  int? r;
@override@JsonKey(name: 'g') final  int? g;
@override@JsonKey(name: 'b') final  int? b;
@override@JsonKey(name: 'rssi') final  int? rssi;

/// Create a copy of MqttLampStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttLampStatusModelCopyWith<_MqttLampStatusModel> get copyWith => __$MqttLampStatusModelCopyWithImpl<_MqttLampStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MqttLampStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttLampStatusModel&&const DeepCollectionEquality().equals(other.temp, temp)&&const DeepCollectionEquality().equals(other.hum, hum)&&(identical(other.isOn, isOn) || other.isOn == isOn)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.r, r) || other.r == r)&&(identical(other.g, g) || other.g == g)&&(identical(other.b, b) || other.b == b)&&(identical(other.rssi, rssi) || other.rssi == rssi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(temp),const DeepCollectionEquality().hash(hum),isOn,brightness,ledMode,brightMode,r,g,b,rssi);

@override
String toString() {
  return 'MqttLampStatusModel(temp: $temp, hum: $hum, isOn: $isOn, brightness: $brightness, ledMode: $ledMode, brightMode: $brightMode, r: $r, g: $g, b: $b, rssi: $rssi)';
}


}

/// @nodoc
abstract mixin class _$MqttLampStatusModelCopyWith<$Res> implements $MqttLampStatusModelCopyWith<$Res> {
  factory _$MqttLampStatusModelCopyWith(_MqttLampStatusModel value, $Res Function(_MqttLampStatusModel) _then) = __$MqttLampStatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'temp') dynamic temp,@JsonKey(name: 'hum') dynamic hum,@JsonKey(name: 'isOn') bool? isOn,@JsonKey(name: 'brightness') int? brightness,@JsonKey(name: 'ledMode') int? ledMode,@JsonKey(name: 'brightMode') int? brightMode,@JsonKey(name: 'r') int? r,@JsonKey(name: 'g') int? g,@JsonKey(name: 'b') int? b,@JsonKey(name: 'rssi') int? rssi
});




}
/// @nodoc
class __$MqttLampStatusModelCopyWithImpl<$Res>
    implements _$MqttLampStatusModelCopyWith<$Res> {
  __$MqttLampStatusModelCopyWithImpl(this._self, this._then);

  final _MqttLampStatusModel _self;
  final $Res Function(_MqttLampStatusModel) _then;

/// Create a copy of MqttLampStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = freezed,Object? hum = freezed,Object? isOn = freezed,Object? brightness = freezed,Object? ledMode = freezed,Object? brightMode = freezed,Object? r = freezed,Object? g = freezed,Object? b = freezed,Object? rssi = freezed,}) {
  return _then(_MqttLampStatusModel(
temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as dynamic,hum: freezed == hum ? _self.hum : hum // ignore: cast_nullable_to_non_nullable
as dynamic,isOn: freezed == isOn ? _self.isOn : isOn // ignore: cast_nullable_to_non_nullable
as bool?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int?,ledMode: freezed == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int?,brightMode: freezed == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int?,r: freezed == r ? _self.r : r // ignore: cast_nullable_to_non_nullable
as int?,g: freezed == g ? _self.g : g // ignore: cast_nullable_to_non_nullable
as int?,b: freezed == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as int?,rssi: freezed == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
