// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_setup_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MqttSetupFormData {

 String get deviceName; String get selectedSsid; String get wifiPassword; String get mqttIp; String get selectedDeviceId;
/// Create a copy of MqttSetupFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttSetupFormDataCopyWith<MqttSetupFormData> get copyWith => _$MqttSetupFormDataCopyWithImpl<MqttSetupFormData>(this as MqttSetupFormData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttSetupFormData&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&(identical(other.mqttIp, mqttIp) || other.mqttIp == mqttIp)&&(identical(other.selectedDeviceId, selectedDeviceId) || other.selectedDeviceId == selectedDeviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceName,selectedSsid,wifiPassword,mqttIp,selectedDeviceId);

@override
String toString() {
  return 'MqttSetupFormData(deviceName: $deviceName, selectedSsid: $selectedSsid, wifiPassword: $wifiPassword, mqttIp: $mqttIp, selectedDeviceId: $selectedDeviceId)';
}


}

/// @nodoc
abstract mixin class $MqttSetupFormDataCopyWith<$Res>  {
  factory $MqttSetupFormDataCopyWith(MqttSetupFormData value, $Res Function(MqttSetupFormData) _then) = _$MqttSetupFormDataCopyWithImpl;
@useResult
$Res call({
 String deviceName, String selectedSsid, String wifiPassword, String mqttIp, String selectedDeviceId
});




}
/// @nodoc
class _$MqttSetupFormDataCopyWithImpl<$Res>
    implements $MqttSetupFormDataCopyWith<$Res> {
  _$MqttSetupFormDataCopyWithImpl(this._self, this._then);

  final MqttSetupFormData _self;
  final $Res Function(MqttSetupFormData) _then;

/// Create a copy of MqttSetupFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceName = null,Object? selectedSsid = null,Object? wifiPassword = null,Object? mqttIp = null,Object? selectedDeviceId = null,}) {
  return _then(_self.copyWith(
deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,selectedSsid: null == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String,wifiPassword: null == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String,mqttIp: null == mqttIp ? _self.mqttIp : mqttIp // ignore: cast_nullable_to_non_nullable
as String,selectedDeviceId: null == selectedDeviceId ? _self.selectedDeviceId : selectedDeviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MqttSetupFormData].
extension MqttSetupFormDataPatterns on MqttSetupFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttSetupFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttSetupFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttSetupFormData value)  $default,){
final _that = this;
switch (_that) {
case _MqttSetupFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttSetupFormData value)?  $default,){
final _that = this;
switch (_that) {
case _MqttSetupFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceName,  String selectedSsid,  String wifiPassword,  String mqttIp,  String selectedDeviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttSetupFormData() when $default != null:
return $default(_that.deviceName,_that.selectedSsid,_that.wifiPassword,_that.mqttIp,_that.selectedDeviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceName,  String selectedSsid,  String wifiPassword,  String mqttIp,  String selectedDeviceId)  $default,) {final _that = this;
switch (_that) {
case _MqttSetupFormData():
return $default(_that.deviceName,_that.selectedSsid,_that.wifiPassword,_that.mqttIp,_that.selectedDeviceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceName,  String selectedSsid,  String wifiPassword,  String mqttIp,  String selectedDeviceId)?  $default,) {final _that = this;
switch (_that) {
case _MqttSetupFormData() when $default != null:
return $default(_that.deviceName,_that.selectedSsid,_that.wifiPassword,_that.mqttIp,_that.selectedDeviceId);case _:
  return null;

}
}

}

/// @nodoc


class _MqttSetupFormData implements MqttSetupFormData {
  const _MqttSetupFormData({this.deviceName = '', this.selectedSsid = '', this.wifiPassword = '', this.mqttIp = '', this.selectedDeviceId = ''});
  

@override@JsonKey() final  String deviceName;
@override@JsonKey() final  String selectedSsid;
@override@JsonKey() final  String wifiPassword;
@override@JsonKey() final  String mqttIp;
@override@JsonKey() final  String selectedDeviceId;

/// Create a copy of MqttSetupFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttSetupFormDataCopyWith<_MqttSetupFormData> get copyWith => __$MqttSetupFormDataCopyWithImpl<_MqttSetupFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttSetupFormData&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&(identical(other.mqttIp, mqttIp) || other.mqttIp == mqttIp)&&(identical(other.selectedDeviceId, selectedDeviceId) || other.selectedDeviceId == selectedDeviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceName,selectedSsid,wifiPassword,mqttIp,selectedDeviceId);

@override
String toString() {
  return 'MqttSetupFormData(deviceName: $deviceName, selectedSsid: $selectedSsid, wifiPassword: $wifiPassword, mqttIp: $mqttIp, selectedDeviceId: $selectedDeviceId)';
}


}

/// @nodoc
abstract mixin class _$MqttSetupFormDataCopyWith<$Res> implements $MqttSetupFormDataCopyWith<$Res> {
  factory _$MqttSetupFormDataCopyWith(_MqttSetupFormData value, $Res Function(_MqttSetupFormData) _then) = __$MqttSetupFormDataCopyWithImpl;
@override @useResult
$Res call({
 String deviceName, String selectedSsid, String wifiPassword, String mqttIp, String selectedDeviceId
});




}
/// @nodoc
class __$MqttSetupFormDataCopyWithImpl<$Res>
    implements _$MqttSetupFormDataCopyWith<$Res> {
  __$MqttSetupFormDataCopyWithImpl(this._self, this._then);

  final _MqttSetupFormData _self;
  final $Res Function(_MqttSetupFormData) _then;

/// Create a copy of MqttSetupFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceName = null,Object? selectedSsid = null,Object? wifiPassword = null,Object? mqttIp = null,Object? selectedDeviceId = null,}) {
  return _then(_MqttSetupFormData(
deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,selectedSsid: null == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String,wifiPassword: null == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String,mqttIp: null == mqttIp ? _self.mqttIp : mqttIp // ignore: cast_nullable_to_non_nullable
as String,selectedDeviceId: null == selectedDeviceId ? _self.selectedDeviceId : selectedDeviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
