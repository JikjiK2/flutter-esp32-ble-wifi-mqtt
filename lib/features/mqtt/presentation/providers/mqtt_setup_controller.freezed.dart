// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_setup_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MqttSetupState {

 String get selectedDeviceId; String get deviceName; String get selectedSsid; String get wifiPassword; String get mqttIp; List<MqttSetupNetwork> get scanResults; bool get isScanning; bool get isGpsOff; MqttSetupStep get currentStep; String? get stepError; bool get isProcessing; String get loadingMessage;
/// Create a copy of MqttSetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttSetupStateCopyWith<MqttSetupState> get copyWith => _$MqttSetupStateCopyWithImpl<MqttSetupState>(this as MqttSetupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttSetupState&&(identical(other.selectedDeviceId, selectedDeviceId) || other.selectedDeviceId == selectedDeviceId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&(identical(other.mqttIp, mqttIp) || other.mqttIp == mqttIp)&&const DeepCollectionEquality().equals(other.scanResults, scanResults)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.isGpsOff, isGpsOff) || other.isGpsOff == isGpsOff)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.stepError, stepError) || other.stepError == stepError)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.loadingMessage, loadingMessage) || other.loadingMessage == loadingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDeviceId,deviceName,selectedSsid,wifiPassword,mqttIp,const DeepCollectionEquality().hash(scanResults),isScanning,isGpsOff,currentStep,stepError,isProcessing,loadingMessage);

@override
String toString() {
  return 'MqttSetupState(selectedDeviceId: $selectedDeviceId, deviceName: $deviceName, selectedSsid: $selectedSsid, wifiPassword: $wifiPassword, mqttIp: $mqttIp, scanResults: $scanResults, isScanning: $isScanning, isGpsOff: $isGpsOff, currentStep: $currentStep, stepError: $stepError, isProcessing: $isProcessing, loadingMessage: $loadingMessage)';
}


}

/// @nodoc
abstract mixin class $MqttSetupStateCopyWith<$Res>  {
  factory $MqttSetupStateCopyWith(MqttSetupState value, $Res Function(MqttSetupState) _then) = _$MqttSetupStateCopyWithImpl;
@useResult
$Res call({
 String selectedDeviceId, String deviceName, String selectedSsid, String wifiPassword, String mqttIp, List<MqttSetupNetwork> scanResults, bool isScanning, bool isGpsOff, MqttSetupStep currentStep, String? stepError, bool isProcessing, String loadingMessage
});




}
/// @nodoc
class _$MqttSetupStateCopyWithImpl<$Res>
    implements $MqttSetupStateCopyWith<$Res> {
  _$MqttSetupStateCopyWithImpl(this._self, this._then);

  final MqttSetupState _self;
  final $Res Function(MqttSetupState) _then;

/// Create a copy of MqttSetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDeviceId = null,Object? deviceName = null,Object? selectedSsid = null,Object? wifiPassword = null,Object? mqttIp = null,Object? scanResults = null,Object? isScanning = null,Object? isGpsOff = null,Object? currentStep = null,Object? stepError = freezed,Object? isProcessing = null,Object? loadingMessage = null,}) {
  return _then(_self.copyWith(
selectedDeviceId: null == selectedDeviceId ? _self.selectedDeviceId : selectedDeviceId // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,selectedSsid: null == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String,wifiPassword: null == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String,mqttIp: null == mqttIp ? _self.mqttIp : mqttIp // ignore: cast_nullable_to_non_nullable
as String,scanResults: null == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<MqttSetupNetwork>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,isGpsOff: null == isGpsOff ? _self.isGpsOff : isGpsOff // ignore: cast_nullable_to_non_nullable
as bool,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as MqttSetupStep,stepError: freezed == stepError ? _self.stepError : stepError // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,loadingMessage: null == loadingMessage ? _self.loadingMessage : loadingMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MqttSetupState].
extension MqttSetupStatePatterns on MqttSetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttSetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttSetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttSetupState value)  $default,){
final _that = this;
switch (_that) {
case _MqttSetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttSetupState value)?  $default,){
final _that = this;
switch (_that) {
case _MqttSetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedDeviceId,  String deviceName,  String selectedSsid,  String wifiPassword,  String mqttIp,  List<MqttSetupNetwork> scanResults,  bool isScanning,  bool isGpsOff,  MqttSetupStep currentStep,  String? stepError,  bool isProcessing,  String loadingMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttSetupState() when $default != null:
return $default(_that.selectedDeviceId,_that.deviceName,_that.selectedSsid,_that.wifiPassword,_that.mqttIp,_that.scanResults,_that.isScanning,_that.isGpsOff,_that.currentStep,_that.stepError,_that.isProcessing,_that.loadingMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedDeviceId,  String deviceName,  String selectedSsid,  String wifiPassword,  String mqttIp,  List<MqttSetupNetwork> scanResults,  bool isScanning,  bool isGpsOff,  MqttSetupStep currentStep,  String? stepError,  bool isProcessing,  String loadingMessage)  $default,) {final _that = this;
switch (_that) {
case _MqttSetupState():
return $default(_that.selectedDeviceId,_that.deviceName,_that.selectedSsid,_that.wifiPassword,_that.mqttIp,_that.scanResults,_that.isScanning,_that.isGpsOff,_that.currentStep,_that.stepError,_that.isProcessing,_that.loadingMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedDeviceId,  String deviceName,  String selectedSsid,  String wifiPassword,  String mqttIp,  List<MqttSetupNetwork> scanResults,  bool isScanning,  bool isGpsOff,  MqttSetupStep currentStep,  String? stepError,  bool isProcessing,  String loadingMessage)?  $default,) {final _that = this;
switch (_that) {
case _MqttSetupState() when $default != null:
return $default(_that.selectedDeviceId,_that.deviceName,_that.selectedSsid,_that.wifiPassword,_that.mqttIp,_that.scanResults,_that.isScanning,_that.isGpsOff,_that.currentStep,_that.stepError,_that.isProcessing,_that.loadingMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MqttSetupState implements MqttSetupState {
  const _MqttSetupState({this.selectedDeviceId = '', this.deviceName = '', this.selectedSsid = '', this.wifiPassword = '', this.mqttIp = '', final  List<MqttSetupNetwork> scanResults = const [], this.isScanning = false, this.isGpsOff = false, this.currentStep = MqttSetupStep.guidelines, this.stepError, this.isProcessing = false, this.loadingMessage = ""}): _scanResults = scanResults;
  

@override@JsonKey() final  String selectedDeviceId;
@override@JsonKey() final  String deviceName;
@override@JsonKey() final  String selectedSsid;
@override@JsonKey() final  String wifiPassword;
@override@JsonKey() final  String mqttIp;
 final  List<MqttSetupNetwork> _scanResults;
@override@JsonKey() List<MqttSetupNetwork> get scanResults {
  if (_scanResults is EqualUnmodifiableListView) return _scanResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResults);
}

@override@JsonKey() final  bool isScanning;
@override@JsonKey() final  bool isGpsOff;
@override@JsonKey() final  MqttSetupStep currentStep;
@override final  String? stepError;
@override@JsonKey() final  bool isProcessing;
@override@JsonKey() final  String loadingMessage;

/// Create a copy of MqttSetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttSetupStateCopyWith<_MqttSetupState> get copyWith => __$MqttSetupStateCopyWithImpl<_MqttSetupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttSetupState&&(identical(other.selectedDeviceId, selectedDeviceId) || other.selectedDeviceId == selectedDeviceId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&(identical(other.mqttIp, mqttIp) || other.mqttIp == mqttIp)&&const DeepCollectionEquality().equals(other._scanResults, _scanResults)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.isGpsOff, isGpsOff) || other.isGpsOff == isGpsOff)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.stepError, stepError) || other.stepError == stepError)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.loadingMessage, loadingMessage) || other.loadingMessage == loadingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDeviceId,deviceName,selectedSsid,wifiPassword,mqttIp,const DeepCollectionEquality().hash(_scanResults),isScanning,isGpsOff,currentStep,stepError,isProcessing,loadingMessage);

@override
String toString() {
  return 'MqttSetupState(selectedDeviceId: $selectedDeviceId, deviceName: $deviceName, selectedSsid: $selectedSsid, wifiPassword: $wifiPassword, mqttIp: $mqttIp, scanResults: $scanResults, isScanning: $isScanning, isGpsOff: $isGpsOff, currentStep: $currentStep, stepError: $stepError, isProcessing: $isProcessing, loadingMessage: $loadingMessage)';
}


}

/// @nodoc
abstract mixin class _$MqttSetupStateCopyWith<$Res> implements $MqttSetupStateCopyWith<$Res> {
  factory _$MqttSetupStateCopyWith(_MqttSetupState value, $Res Function(_MqttSetupState) _then) = __$MqttSetupStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedDeviceId, String deviceName, String selectedSsid, String wifiPassword, String mqttIp, List<MqttSetupNetwork> scanResults, bool isScanning, bool isGpsOff, MqttSetupStep currentStep, String? stepError, bool isProcessing, String loadingMessage
});




}
/// @nodoc
class __$MqttSetupStateCopyWithImpl<$Res>
    implements _$MqttSetupStateCopyWith<$Res> {
  __$MqttSetupStateCopyWithImpl(this._self, this._then);

  final _MqttSetupState _self;
  final $Res Function(_MqttSetupState) _then;

/// Create a copy of MqttSetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDeviceId = null,Object? deviceName = null,Object? selectedSsid = null,Object? wifiPassword = null,Object? mqttIp = null,Object? scanResults = null,Object? isScanning = null,Object? isGpsOff = null,Object? currentStep = null,Object? stepError = freezed,Object? isProcessing = null,Object? loadingMessage = null,}) {
  return _then(_MqttSetupState(
selectedDeviceId: null == selectedDeviceId ? _self.selectedDeviceId : selectedDeviceId // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,selectedSsid: null == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String,wifiPassword: null == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String,mqttIp: null == mqttIp ? _self.mqttIp : mqttIp // ignore: cast_nullable_to_non_nullable
as String,scanResults: null == scanResults ? _self._scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<MqttSetupNetwork>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,isGpsOff: null == isGpsOff ? _self.isGpsOff : isGpsOff // ignore: cast_nullable_to_non_nullable
as bool,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as MqttSetupStep,stepError: freezed == stepError ? _self.stepError : stepError // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,loadingMessage: null == loadingMessage ? _self.loadingMessage : loadingMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
