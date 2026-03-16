// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_setup_network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MqttSetupNetwork {

 String get ssid; int get rssi; bool get isSecure;
/// Create a copy of MqttSetupNetwork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttSetupNetworkCopyWith<MqttSetupNetwork> get copyWith => _$MqttSetupNetworkCopyWithImpl<MqttSetupNetwork>(this as MqttSetupNetwork, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttSetupNetwork&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.isSecure, isSecure) || other.isSecure == isSecure));
}


@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,isSecure);

@override
String toString() {
  return 'MqttSetupNetwork(ssid: $ssid, rssi: $rssi, isSecure: $isSecure)';
}


}

/// @nodoc
abstract mixin class $MqttSetupNetworkCopyWith<$Res>  {
  factory $MqttSetupNetworkCopyWith(MqttSetupNetwork value, $Res Function(MqttSetupNetwork) _then) = _$MqttSetupNetworkCopyWithImpl;
@useResult
$Res call({
 String ssid, int rssi, bool isSecure
});




}
/// @nodoc
class _$MqttSetupNetworkCopyWithImpl<$Res>
    implements $MqttSetupNetworkCopyWith<$Res> {
  _$MqttSetupNetworkCopyWithImpl(this._self, this._then);

  final MqttSetupNetwork _self;
  final $Res Function(MqttSetupNetwork) _then;

/// Create a copy of MqttSetupNetwork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ssid = null,Object? rssi = null,Object? isSecure = null,}) {
  return _then(_self.copyWith(
ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,isSecure: null == isSecure ? _self.isSecure : isSecure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MqttSetupNetwork].
extension MqttSetupNetworkPatterns on MqttSetupNetwork {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttSetupNetwork value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttSetupNetwork() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttSetupNetwork value)  $default,){
final _that = this;
switch (_that) {
case _MqttSetupNetwork():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttSetupNetwork value)?  $default,){
final _that = this;
switch (_that) {
case _MqttSetupNetwork() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ssid,  int rssi,  bool isSecure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttSetupNetwork() when $default != null:
return $default(_that.ssid,_that.rssi,_that.isSecure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ssid,  int rssi,  bool isSecure)  $default,) {final _that = this;
switch (_that) {
case _MqttSetupNetwork():
return $default(_that.ssid,_that.rssi,_that.isSecure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ssid,  int rssi,  bool isSecure)?  $default,) {final _that = this;
switch (_that) {
case _MqttSetupNetwork() when $default != null:
return $default(_that.ssid,_that.rssi,_that.isSecure);case _:
  return null;

}
}

}

/// @nodoc


class _MqttSetupNetwork implements MqttSetupNetwork {
  const _MqttSetupNetwork({required this.ssid, required this.rssi, this.isSecure = false});
  

@override final  String ssid;
@override final  int rssi;
@override@JsonKey() final  bool isSecure;

/// Create a copy of MqttSetupNetwork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttSetupNetworkCopyWith<_MqttSetupNetwork> get copyWith => __$MqttSetupNetworkCopyWithImpl<_MqttSetupNetwork>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttSetupNetwork&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.isSecure, isSecure) || other.isSecure == isSecure));
}


@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,isSecure);

@override
String toString() {
  return 'MqttSetupNetwork(ssid: $ssid, rssi: $rssi, isSecure: $isSecure)';
}


}

/// @nodoc
abstract mixin class _$MqttSetupNetworkCopyWith<$Res> implements $MqttSetupNetworkCopyWith<$Res> {
  factory _$MqttSetupNetworkCopyWith(_MqttSetupNetwork value, $Res Function(_MqttSetupNetwork) _then) = __$MqttSetupNetworkCopyWithImpl;
@override @useResult
$Res call({
 String ssid, int rssi, bool isSecure
});




}
/// @nodoc
class __$MqttSetupNetworkCopyWithImpl<$Res>
    implements _$MqttSetupNetworkCopyWith<$Res> {
  __$MqttSetupNetworkCopyWithImpl(this._self, this._then);

  final _MqttSetupNetwork _self;
  final $Res Function(_MqttSetupNetwork) _then;

/// Create a copy of MqttSetupNetwork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ssid = null,Object? rssi = null,Object? isSecure = null,}) {
  return _then(_MqttSetupNetwork(
ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,isSecure: null == isSecure ? _self.isSecure : isSecure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
