// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_control_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleControlState {

 LampStatus get localStatus; bool get isInteracting;
/// Create a copy of BleControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleControlStateCopyWith<BleControlState> get copyWith => _$BleControlStateCopyWithImpl<BleControlState>(this as BleControlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleControlState&&(identical(other.localStatus, localStatus) || other.localStatus == localStatus)&&(identical(other.isInteracting, isInteracting) || other.isInteracting == isInteracting));
}


@override
int get hashCode => Object.hash(runtimeType,localStatus,isInteracting);

@override
String toString() {
  return 'BleControlState(localStatus: $localStatus, isInteracting: $isInteracting)';
}


}

/// @nodoc
abstract mixin class $BleControlStateCopyWith<$Res>  {
  factory $BleControlStateCopyWith(BleControlState value, $Res Function(BleControlState) _then) = _$BleControlStateCopyWithImpl;
@useResult
$Res call({
 LampStatus localStatus, bool isInteracting
});


$LampStatusCopyWith<$Res> get localStatus;

}
/// @nodoc
class _$BleControlStateCopyWithImpl<$Res>
    implements $BleControlStateCopyWith<$Res> {
  _$BleControlStateCopyWithImpl(this._self, this._then);

  final BleControlState _self;
  final $Res Function(BleControlState) _then;

/// Create a copy of BleControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localStatus = null,Object? isInteracting = null,}) {
  return _then(_self.copyWith(
localStatus: null == localStatus ? _self.localStatus : localStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,isInteracting: null == isInteracting ? _self.isInteracting : isInteracting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of BleControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LampStatusCopyWith<$Res> get localStatus {
  
  return $LampStatusCopyWith<$Res>(_self.localStatus, (value) {
    return _then(_self.copyWith(localStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [BleControlState].
extension BleControlStatePatterns on BleControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleControlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleControlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleControlState value)  $default,){
final _that = this;
switch (_that) {
case _BleControlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleControlState value)?  $default,){
final _that = this;
switch (_that) {
case _BleControlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LampStatus localStatus,  bool isInteracting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleControlState() when $default != null:
return $default(_that.localStatus,_that.isInteracting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LampStatus localStatus,  bool isInteracting)  $default,) {final _that = this;
switch (_that) {
case _BleControlState():
return $default(_that.localStatus,_that.isInteracting);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LampStatus localStatus,  bool isInteracting)?  $default,) {final _that = this;
switch (_that) {
case _BleControlState() when $default != null:
return $default(_that.localStatus,_that.isInteracting);case _:
  return null;

}
}

}

/// @nodoc


class _BleControlState implements BleControlState {
  const _BleControlState({required this.localStatus, this.isInteracting = false});
  

@override final  LampStatus localStatus;
@override@JsonKey() final  bool isInteracting;

/// Create a copy of BleControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleControlStateCopyWith<_BleControlState> get copyWith => __$BleControlStateCopyWithImpl<_BleControlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleControlState&&(identical(other.localStatus, localStatus) || other.localStatus == localStatus)&&(identical(other.isInteracting, isInteracting) || other.isInteracting == isInteracting));
}


@override
int get hashCode => Object.hash(runtimeType,localStatus,isInteracting);

@override
String toString() {
  return 'BleControlState(localStatus: $localStatus, isInteracting: $isInteracting)';
}


}

/// @nodoc
abstract mixin class _$BleControlStateCopyWith<$Res> implements $BleControlStateCopyWith<$Res> {
  factory _$BleControlStateCopyWith(_BleControlState value, $Res Function(_BleControlState) _then) = __$BleControlStateCopyWithImpl;
@override @useResult
$Res call({
 LampStatus localStatus, bool isInteracting
});


@override $LampStatusCopyWith<$Res> get localStatus;

}
/// @nodoc
class __$BleControlStateCopyWithImpl<$Res>
    implements _$BleControlStateCopyWith<$Res> {
  __$BleControlStateCopyWithImpl(this._self, this._then);

  final _BleControlState _self;
  final $Res Function(_BleControlState) _then;

/// Create a copy of BleControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localStatus = null,Object? isInteracting = null,}) {
  return _then(_BleControlState(
localStatus: null == localStatus ? _self.localStatus : localStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,isInteracting: null == isInteracting ? _self.isInteracting : isInteracting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BleControlState
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
