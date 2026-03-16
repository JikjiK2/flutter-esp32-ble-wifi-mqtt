// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_control_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiControlState {

 LampStatus get localStatus; bool get isInteracting; ConnectionStatus get connectionStatus; String? get currentIp; bool get isDiscovering; bool get isInitialLoading;
/// Create a copy of WifiControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiControlStateCopyWith<WifiControlState> get copyWith => _$WifiControlStateCopyWithImpl<WifiControlState>(this as WifiControlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiControlState&&(identical(other.localStatus, localStatus) || other.localStatus == localStatus)&&(identical(other.isInteracting, isInteracting) || other.isInteracting == isInteracting)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.currentIp, currentIp) || other.currentIp == currentIp)&&(identical(other.isDiscovering, isDiscovering) || other.isDiscovering == isDiscovering)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading));
}


@override
int get hashCode => Object.hash(runtimeType,localStatus,isInteracting,connectionStatus,currentIp,isDiscovering,isInitialLoading);

@override
String toString() {
  return 'WifiControlState(localStatus: $localStatus, isInteracting: $isInteracting, connectionStatus: $connectionStatus, currentIp: $currentIp, isDiscovering: $isDiscovering, isInitialLoading: $isInitialLoading)';
}


}

/// @nodoc
abstract mixin class $WifiControlStateCopyWith<$Res>  {
  factory $WifiControlStateCopyWith(WifiControlState value, $Res Function(WifiControlState) _then) = _$WifiControlStateCopyWithImpl;
@useResult
$Res call({
 LampStatus localStatus, bool isInteracting, ConnectionStatus connectionStatus, String? currentIp, bool isDiscovering, bool isInitialLoading
});


$LampStatusCopyWith<$Res> get localStatus;

}
/// @nodoc
class _$WifiControlStateCopyWithImpl<$Res>
    implements $WifiControlStateCopyWith<$Res> {
  _$WifiControlStateCopyWithImpl(this._self, this._then);

  final WifiControlState _self;
  final $Res Function(WifiControlState) _then;

/// Create a copy of WifiControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localStatus = null,Object? isInteracting = null,Object? connectionStatus = null,Object? currentIp = freezed,Object? isDiscovering = null,Object? isInitialLoading = null,}) {
  return _then(_self.copyWith(
localStatus: null == localStatus ? _self.localStatus : localStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,isInteracting: null == isInteracting ? _self.isInteracting : isInteracting // ignore: cast_nullable_to_non_nullable
as bool,connectionStatus: null == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as ConnectionStatus,currentIp: freezed == currentIp ? _self.currentIp : currentIp // ignore: cast_nullable_to_non_nullable
as String?,isDiscovering: null == isDiscovering ? _self.isDiscovering : isDiscovering // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WifiControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LampStatusCopyWith<$Res> get localStatus {
  
  return $LampStatusCopyWith<$Res>(_self.localStatus, (value) {
    return _then(_self.copyWith(localStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [WifiControlState].
extension WifiControlStatePatterns on WifiControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiControlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiControlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiControlState value)  $default,){
final _that = this;
switch (_that) {
case _WifiControlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiControlState value)?  $default,){
final _that = this;
switch (_that) {
case _WifiControlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LampStatus localStatus,  bool isInteracting,  ConnectionStatus connectionStatus,  String? currentIp,  bool isDiscovering,  bool isInitialLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiControlState() when $default != null:
return $default(_that.localStatus,_that.isInteracting,_that.connectionStatus,_that.currentIp,_that.isDiscovering,_that.isInitialLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LampStatus localStatus,  bool isInteracting,  ConnectionStatus connectionStatus,  String? currentIp,  bool isDiscovering,  bool isInitialLoading)  $default,) {final _that = this;
switch (_that) {
case _WifiControlState():
return $default(_that.localStatus,_that.isInteracting,_that.connectionStatus,_that.currentIp,_that.isDiscovering,_that.isInitialLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LampStatus localStatus,  bool isInteracting,  ConnectionStatus connectionStatus,  String? currentIp,  bool isDiscovering,  bool isInitialLoading)?  $default,) {final _that = this;
switch (_that) {
case _WifiControlState() when $default != null:
return $default(_that.localStatus,_that.isInteracting,_that.connectionStatus,_that.currentIp,_that.isDiscovering,_that.isInitialLoading);case _:
  return null;

}
}

}

/// @nodoc


class _WifiControlState implements WifiControlState {
  const _WifiControlState({required this.localStatus, this.isInteracting = false, this.connectionStatus = ConnectionStatus.disconnected, this.currentIp, this.isDiscovering = false, this.isInitialLoading = true});
  

@override final  LampStatus localStatus;
@override@JsonKey() final  bool isInteracting;
@override@JsonKey() final  ConnectionStatus connectionStatus;
@override final  String? currentIp;
@override@JsonKey() final  bool isDiscovering;
@override@JsonKey() final  bool isInitialLoading;

/// Create a copy of WifiControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiControlStateCopyWith<_WifiControlState> get copyWith => __$WifiControlStateCopyWithImpl<_WifiControlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiControlState&&(identical(other.localStatus, localStatus) || other.localStatus == localStatus)&&(identical(other.isInteracting, isInteracting) || other.isInteracting == isInteracting)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.currentIp, currentIp) || other.currentIp == currentIp)&&(identical(other.isDiscovering, isDiscovering) || other.isDiscovering == isDiscovering)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading));
}


@override
int get hashCode => Object.hash(runtimeType,localStatus,isInteracting,connectionStatus,currentIp,isDiscovering,isInitialLoading);

@override
String toString() {
  return 'WifiControlState(localStatus: $localStatus, isInteracting: $isInteracting, connectionStatus: $connectionStatus, currentIp: $currentIp, isDiscovering: $isDiscovering, isInitialLoading: $isInitialLoading)';
}


}

/// @nodoc
abstract mixin class _$WifiControlStateCopyWith<$Res> implements $WifiControlStateCopyWith<$Res> {
  factory _$WifiControlStateCopyWith(_WifiControlState value, $Res Function(_WifiControlState) _then) = __$WifiControlStateCopyWithImpl;
@override @useResult
$Res call({
 LampStatus localStatus, bool isInteracting, ConnectionStatus connectionStatus, String? currentIp, bool isDiscovering, bool isInitialLoading
});


@override $LampStatusCopyWith<$Res> get localStatus;

}
/// @nodoc
class __$WifiControlStateCopyWithImpl<$Res>
    implements _$WifiControlStateCopyWith<$Res> {
  __$WifiControlStateCopyWithImpl(this._self, this._then);

  final _WifiControlState _self;
  final $Res Function(_WifiControlState) _then;

/// Create a copy of WifiControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localStatus = null,Object? isInteracting = null,Object? connectionStatus = null,Object? currentIp = freezed,Object? isDiscovering = null,Object? isInitialLoading = null,}) {
  return _then(_WifiControlState(
localStatus: null == localStatus ? _self.localStatus : localStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,isInteracting: null == isInteracting ? _self.isInteracting : isInteracting // ignore: cast_nullable_to_non_nullable
as bool,connectionStatus: null == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as ConnectionStatus,currentIp: freezed == currentIp ? _self.currentIp : currentIp // ignore: cast_nullable_to_non_nullable
as String?,isDiscovering: null == isDiscovering ? _self.isDiscovering : isDiscovering // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WifiControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LampStatusCopyWith<$Res> get localStatus {
  
  return $LampStatusCopyWith<$Res>(_self.localStatus, (value) {
    return _then(_self.copyWith(localStatus: value));
  });
}
}

// dart format on
