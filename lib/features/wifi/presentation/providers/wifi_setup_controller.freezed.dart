// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_setup_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiSetupState {

 String get selectedDeviceId; String get selectedSsid; String get wifiPassword; List<WifiNetwork> get scanResults; bool get isScanning; WifiSetupStep get currentStep; String? get stepError; bool get isProcessing; String get loadingMessage;
/// Create a copy of WifiSetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiSetupStateCopyWith<WifiSetupState> get copyWith => _$WifiSetupStateCopyWithImpl<WifiSetupState>(this as WifiSetupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiSetupState&&(identical(other.selectedDeviceId, selectedDeviceId) || other.selectedDeviceId == selectedDeviceId)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&const DeepCollectionEquality().equals(other.scanResults, scanResults)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.stepError, stepError) || other.stepError == stepError)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.loadingMessage, loadingMessage) || other.loadingMessage == loadingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDeviceId,selectedSsid,wifiPassword,const DeepCollectionEquality().hash(scanResults),isScanning,currentStep,stepError,isProcessing,loadingMessage);

@override
String toString() {
  return 'WifiSetupState(selectedDeviceId: $selectedDeviceId, selectedSsid: $selectedSsid, wifiPassword: $wifiPassword, scanResults: $scanResults, isScanning: $isScanning, currentStep: $currentStep, stepError: $stepError, isProcessing: $isProcessing, loadingMessage: $loadingMessage)';
}


}

/// @nodoc
abstract mixin class $WifiSetupStateCopyWith<$Res>  {
  factory $WifiSetupStateCopyWith(WifiSetupState value, $Res Function(WifiSetupState) _then) = _$WifiSetupStateCopyWithImpl;
@useResult
$Res call({
 String selectedDeviceId, String selectedSsid, String wifiPassword, List<WifiNetwork> scanResults, bool isScanning, WifiSetupStep currentStep, String? stepError, bool isProcessing, String loadingMessage
});




}
/// @nodoc
class _$WifiSetupStateCopyWithImpl<$Res>
    implements $WifiSetupStateCopyWith<$Res> {
  _$WifiSetupStateCopyWithImpl(this._self, this._then);

  final WifiSetupState _self;
  final $Res Function(WifiSetupState) _then;

/// Create a copy of WifiSetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDeviceId = null,Object? selectedSsid = null,Object? wifiPassword = null,Object? scanResults = null,Object? isScanning = null,Object? currentStep = null,Object? stepError = freezed,Object? isProcessing = null,Object? loadingMessage = null,}) {
  return _then(_self.copyWith(
selectedDeviceId: null == selectedDeviceId ? _self.selectedDeviceId : selectedDeviceId // ignore: cast_nullable_to_non_nullable
as String,selectedSsid: null == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String,wifiPassword: null == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String,scanResults: null == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<WifiNetwork>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as WifiSetupStep,stepError: freezed == stepError ? _self.stepError : stepError // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,loadingMessage: null == loadingMessage ? _self.loadingMessage : loadingMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiSetupState].
extension WifiSetupStatePatterns on WifiSetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiSetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiSetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiSetupState value)  $default,){
final _that = this;
switch (_that) {
case _WifiSetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiSetupState value)?  $default,){
final _that = this;
switch (_that) {
case _WifiSetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedDeviceId,  String selectedSsid,  String wifiPassword,  List<WifiNetwork> scanResults,  bool isScanning,  WifiSetupStep currentStep,  String? stepError,  bool isProcessing,  String loadingMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiSetupState() when $default != null:
return $default(_that.selectedDeviceId,_that.selectedSsid,_that.wifiPassword,_that.scanResults,_that.isScanning,_that.currentStep,_that.stepError,_that.isProcessing,_that.loadingMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedDeviceId,  String selectedSsid,  String wifiPassword,  List<WifiNetwork> scanResults,  bool isScanning,  WifiSetupStep currentStep,  String? stepError,  bool isProcessing,  String loadingMessage)  $default,) {final _that = this;
switch (_that) {
case _WifiSetupState():
return $default(_that.selectedDeviceId,_that.selectedSsid,_that.wifiPassword,_that.scanResults,_that.isScanning,_that.currentStep,_that.stepError,_that.isProcessing,_that.loadingMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedDeviceId,  String selectedSsid,  String wifiPassword,  List<WifiNetwork> scanResults,  bool isScanning,  WifiSetupStep currentStep,  String? stepError,  bool isProcessing,  String loadingMessage)?  $default,) {final _that = this;
switch (_that) {
case _WifiSetupState() when $default != null:
return $default(_that.selectedDeviceId,_that.selectedSsid,_that.wifiPassword,_that.scanResults,_that.isScanning,_that.currentStep,_that.stepError,_that.isProcessing,_that.loadingMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WifiSetupState implements WifiSetupState {
  const _WifiSetupState({this.selectedDeviceId = '', this.selectedSsid = '', this.wifiPassword = '', final  List<WifiNetwork> scanResults = const [], this.isScanning = false, this.currentStep = WifiSetupStep.guidelines, this.stepError, this.isProcessing = false, this.loadingMessage = ""}): _scanResults = scanResults;
  

@override@JsonKey() final  String selectedDeviceId;
@override@JsonKey() final  String selectedSsid;
@override@JsonKey() final  String wifiPassword;
 final  List<WifiNetwork> _scanResults;
@override@JsonKey() List<WifiNetwork> get scanResults {
  if (_scanResults is EqualUnmodifiableListView) return _scanResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResults);
}

@override@JsonKey() final  bool isScanning;
@override@JsonKey() final  WifiSetupStep currentStep;
@override final  String? stepError;
@override@JsonKey() final  bool isProcessing;
@override@JsonKey() final  String loadingMessage;

/// Create a copy of WifiSetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiSetupStateCopyWith<_WifiSetupState> get copyWith => __$WifiSetupStateCopyWithImpl<_WifiSetupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiSetupState&&(identical(other.selectedDeviceId, selectedDeviceId) || other.selectedDeviceId == selectedDeviceId)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&const DeepCollectionEquality().equals(other._scanResults, _scanResults)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.stepError, stepError) || other.stepError == stepError)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.loadingMessage, loadingMessage) || other.loadingMessage == loadingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDeviceId,selectedSsid,wifiPassword,const DeepCollectionEquality().hash(_scanResults),isScanning,currentStep,stepError,isProcessing,loadingMessage);

@override
String toString() {
  return 'WifiSetupState(selectedDeviceId: $selectedDeviceId, selectedSsid: $selectedSsid, wifiPassword: $wifiPassword, scanResults: $scanResults, isScanning: $isScanning, currentStep: $currentStep, stepError: $stepError, isProcessing: $isProcessing, loadingMessage: $loadingMessage)';
}


}

/// @nodoc
abstract mixin class _$WifiSetupStateCopyWith<$Res> implements $WifiSetupStateCopyWith<$Res> {
  factory _$WifiSetupStateCopyWith(_WifiSetupState value, $Res Function(_WifiSetupState) _then) = __$WifiSetupStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedDeviceId, String selectedSsid, String wifiPassword, List<WifiNetwork> scanResults, bool isScanning, WifiSetupStep currentStep, String? stepError, bool isProcessing, String loadingMessage
});




}
/// @nodoc
class __$WifiSetupStateCopyWithImpl<$Res>
    implements _$WifiSetupStateCopyWith<$Res> {
  __$WifiSetupStateCopyWithImpl(this._self, this._then);

  final _WifiSetupState _self;
  final $Res Function(_WifiSetupState) _then;

/// Create a copy of WifiSetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDeviceId = null,Object? selectedSsid = null,Object? wifiPassword = null,Object? scanResults = null,Object? isScanning = null,Object? currentStep = null,Object? stepError = freezed,Object? isProcessing = null,Object? loadingMessage = null,}) {
  return _then(_WifiSetupState(
selectedDeviceId: null == selectedDeviceId ? _self.selectedDeviceId : selectedDeviceId // ignore: cast_nullable_to_non_nullable
as String,selectedSsid: null == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String,wifiPassword: null == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String,scanResults: null == scanResults ? _self._scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<WifiNetwork>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as WifiSetupStep,stepError: freezed == stepError ? _self.stepError : stepError // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,loadingMessage: null == loadingMessage ? _self.loadingMessage : loadingMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
