// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_control_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MqttControlState {

 LampStatus get localStatus; bool get isInteracting; ConnectionStatus get connectionStatus; bool get isInitialLoading;
/// Create a copy of MqttControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttControlStateCopyWith<MqttControlState> get copyWith => _$MqttControlStateCopyWithImpl<MqttControlState>(this as MqttControlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttControlState&&(identical(other.localStatus, localStatus) || other.localStatus == localStatus)&&(identical(other.isInteracting, isInteracting) || other.isInteracting == isInteracting)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading));
}


@override
int get hashCode => Object.hash(runtimeType,localStatus,isInteracting,connectionStatus,isInitialLoading);

@override
String toString() {
  return 'MqttControlState(localStatus: $localStatus, isInteracting: $isInteracting, connectionStatus: $connectionStatus, isInitialLoading: $isInitialLoading)';
}


}

/// @nodoc
abstract mixin class $MqttControlStateCopyWith<$Res>  {
  factory $MqttControlStateCopyWith(MqttControlState value, $Res Function(MqttControlState) _then) = _$MqttControlStateCopyWithImpl;
@useResult
$Res call({
 LampStatus localStatus, bool isInteracting, ConnectionStatus connectionStatus, bool isInitialLoading
});


$LampStatusCopyWith<$Res> get localStatus;

}
/// @nodoc
class _$MqttControlStateCopyWithImpl<$Res>
    implements $MqttControlStateCopyWith<$Res> {
  _$MqttControlStateCopyWithImpl(this._self, this._then);

  final MqttControlState _self;
  final $Res Function(MqttControlState) _then;

/// Create a copy of MqttControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localStatus = null,Object? isInteracting = null,Object? connectionStatus = null,Object? isInitialLoading = null,}) {
  return _then(_self.copyWith(
localStatus: null == localStatus ? _self.localStatus : localStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,isInteracting: null == isInteracting ? _self.isInteracting : isInteracting // ignore: cast_nullable_to_non_nullable
as bool,connectionStatus: null == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as ConnectionStatus,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MqttControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LampStatusCopyWith<$Res> get localStatus {
  
  return $LampStatusCopyWith<$Res>(_self.localStatus, (value) {
    return _then(_self.copyWith(localStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [MqttControlState].
extension MqttControlStatePatterns on MqttControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttControlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttControlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttControlState value)  $default,){
final _that = this;
switch (_that) {
case _MqttControlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttControlState value)?  $default,){
final _that = this;
switch (_that) {
case _MqttControlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LampStatus localStatus,  bool isInteracting,  ConnectionStatus connectionStatus,  bool isInitialLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttControlState() when $default != null:
return $default(_that.localStatus,_that.isInteracting,_that.connectionStatus,_that.isInitialLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LampStatus localStatus,  bool isInteracting,  ConnectionStatus connectionStatus,  bool isInitialLoading)  $default,) {final _that = this;
switch (_that) {
case _MqttControlState():
return $default(_that.localStatus,_that.isInteracting,_that.connectionStatus,_that.isInitialLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LampStatus localStatus,  bool isInteracting,  ConnectionStatus connectionStatus,  bool isInitialLoading)?  $default,) {final _that = this;
switch (_that) {
case _MqttControlState() when $default != null:
return $default(_that.localStatus,_that.isInteracting,_that.connectionStatus,_that.isInitialLoading);case _:
  return null;

}
}

}

/// @nodoc


class _MqttControlState implements MqttControlState {
  const _MqttControlState({required this.localStatus, this.isInteracting = false, this.connectionStatus = ConnectionStatus.disconnected, this.isInitialLoading = false});
  

@override final  LampStatus localStatus;
@override@JsonKey() final  bool isInteracting;
@override@JsonKey() final  ConnectionStatus connectionStatus;
@override@JsonKey() final  bool isInitialLoading;

/// Create a copy of MqttControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttControlStateCopyWith<_MqttControlState> get copyWith => __$MqttControlStateCopyWithImpl<_MqttControlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttControlState&&(identical(other.localStatus, localStatus) || other.localStatus == localStatus)&&(identical(other.isInteracting, isInteracting) || other.isInteracting == isInteracting)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading));
}


@override
int get hashCode => Object.hash(runtimeType,localStatus,isInteracting,connectionStatus,isInitialLoading);

@override
String toString() {
  return 'MqttControlState(localStatus: $localStatus, isInteracting: $isInteracting, connectionStatus: $connectionStatus, isInitialLoading: $isInitialLoading)';
}


}

/// @nodoc
abstract mixin class _$MqttControlStateCopyWith<$Res> implements $MqttControlStateCopyWith<$Res> {
  factory _$MqttControlStateCopyWith(_MqttControlState value, $Res Function(_MqttControlState) _then) = __$MqttControlStateCopyWithImpl;
@override @useResult
$Res call({
 LampStatus localStatus, bool isInteracting, ConnectionStatus connectionStatus, bool isInitialLoading
});


@override $LampStatusCopyWith<$Res> get localStatus;

}
/// @nodoc
class __$MqttControlStateCopyWithImpl<$Res>
    implements _$MqttControlStateCopyWith<$Res> {
  __$MqttControlStateCopyWithImpl(this._self, this._then);

  final _MqttControlState _self;
  final $Res Function(_MqttControlState) _then;

/// Create a copy of MqttControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localStatus = null,Object? isInteracting = null,Object? connectionStatus = null,Object? isInitialLoading = null,}) {
  return _then(_MqttControlState(
localStatus: null == localStatus ? _self.localStatus : localStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,isInteracting: null == isInteracting ? _self.isInteracting : isInteracting // ignore: cast_nullable_to_non_nullable
as bool,connectionStatus: null == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as ConnectionStatus,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MqttControlState
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
