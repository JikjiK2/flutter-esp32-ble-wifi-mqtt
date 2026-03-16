// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_monitoring_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FarmMonitoringState {

 LampStatus get currentStatus; List<SensorHistory> get history; bool get isLoading; String? get errorMessage; String get selectedPeriod;
/// Create a copy of FarmMonitoringState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FarmMonitoringStateCopyWith<FarmMonitoringState> get copyWith => _$FarmMonitoringStateCopyWithImpl<FarmMonitoringState>(this as FarmMonitoringState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmMonitoringState&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus,const DeepCollectionEquality().hash(history),isLoading,errorMessage,selectedPeriod);

@override
String toString() {
  return 'FarmMonitoringState(currentStatus: $currentStatus, history: $history, isLoading: $isLoading, errorMessage: $errorMessage, selectedPeriod: $selectedPeriod)';
}


}

/// @nodoc
abstract mixin class $FarmMonitoringStateCopyWith<$Res>  {
  factory $FarmMonitoringStateCopyWith(FarmMonitoringState value, $Res Function(FarmMonitoringState) _then) = _$FarmMonitoringStateCopyWithImpl;
@useResult
$Res call({
 LampStatus currentStatus, List<SensorHistory> history, bool isLoading, String? errorMessage, String selectedPeriod
});


$LampStatusCopyWith<$Res> get currentStatus;

}
/// @nodoc
class _$FarmMonitoringStateCopyWithImpl<$Res>
    implements $FarmMonitoringStateCopyWith<$Res> {
  _$FarmMonitoringStateCopyWithImpl(this._self, this._then);

  final FarmMonitoringState _self;
  final $Res Function(FarmMonitoringState) _then;

/// Create a copy of FarmMonitoringState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStatus = null,Object? history = null,Object? isLoading = null,Object? errorMessage = freezed,Object? selectedPeriod = null,}) {
  return _then(_self.copyWith(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<SensorHistory>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of FarmMonitoringState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LampStatusCopyWith<$Res> get currentStatus {
  
  return $LampStatusCopyWith<$Res>(_self.currentStatus, (value) {
    return _then(_self.copyWith(currentStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [FarmMonitoringState].
extension FarmMonitoringStatePatterns on FarmMonitoringState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FarmMonitoringState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FarmMonitoringState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FarmMonitoringState value)  $default,){
final _that = this;
switch (_that) {
case _FarmMonitoringState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FarmMonitoringState value)?  $default,){
final _that = this;
switch (_that) {
case _FarmMonitoringState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LampStatus currentStatus,  List<SensorHistory> history,  bool isLoading,  String? errorMessage,  String selectedPeriod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FarmMonitoringState() when $default != null:
return $default(_that.currentStatus,_that.history,_that.isLoading,_that.errorMessage,_that.selectedPeriod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LampStatus currentStatus,  List<SensorHistory> history,  bool isLoading,  String? errorMessage,  String selectedPeriod)  $default,) {final _that = this;
switch (_that) {
case _FarmMonitoringState():
return $default(_that.currentStatus,_that.history,_that.isLoading,_that.errorMessage,_that.selectedPeriod);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LampStatus currentStatus,  List<SensorHistory> history,  bool isLoading,  String? errorMessage,  String selectedPeriod)?  $default,) {final _that = this;
switch (_that) {
case _FarmMonitoringState() when $default != null:
return $default(_that.currentStatus,_that.history,_that.isLoading,_that.errorMessage,_that.selectedPeriod);case _:
  return null;

}
}

}

/// @nodoc


class _FarmMonitoringState implements FarmMonitoringState {
  const _FarmMonitoringState({required this.currentStatus, final  List<SensorHistory> history = const [], this.isLoading = false, this.errorMessage, this.selectedPeriod = "1H"}): _history = history;
  

@override final  LampStatus currentStatus;
 final  List<SensorHistory> _history;
@override@JsonKey() List<SensorHistory> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  String selectedPeriod;

/// Create a copy of FarmMonitoringState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FarmMonitoringStateCopyWith<_FarmMonitoringState> get copyWith => __$FarmMonitoringStateCopyWithImpl<_FarmMonitoringState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FarmMonitoringState&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod));
}


@override
int get hashCode => Object.hash(runtimeType,currentStatus,const DeepCollectionEquality().hash(_history),isLoading,errorMessage,selectedPeriod);

@override
String toString() {
  return 'FarmMonitoringState(currentStatus: $currentStatus, history: $history, isLoading: $isLoading, errorMessage: $errorMessage, selectedPeriod: $selectedPeriod)';
}


}

/// @nodoc
abstract mixin class _$FarmMonitoringStateCopyWith<$Res> implements $FarmMonitoringStateCopyWith<$Res> {
  factory _$FarmMonitoringStateCopyWith(_FarmMonitoringState value, $Res Function(_FarmMonitoringState) _then) = __$FarmMonitoringStateCopyWithImpl;
@override @useResult
$Res call({
 LampStatus currentStatus, List<SensorHistory> history, bool isLoading, String? errorMessage, String selectedPeriod
});


@override $LampStatusCopyWith<$Res> get currentStatus;

}
/// @nodoc
class __$FarmMonitoringStateCopyWithImpl<$Res>
    implements _$FarmMonitoringStateCopyWith<$Res> {
  __$FarmMonitoringStateCopyWithImpl(this._self, this._then);

  final _FarmMonitoringState _self;
  final $Res Function(_FarmMonitoringState) _then;

/// Create a copy of FarmMonitoringState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStatus = null,Object? history = null,Object? isLoading = null,Object? errorMessage = freezed,Object? selectedPeriod = null,}) {
  return _then(_FarmMonitoringState(
currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as LampStatus,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<SensorHistory>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of FarmMonitoringState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LampStatusCopyWith<$Res> get currentStatus {
  
  return $LampStatusCopyWith<$Res>(_self.currentStatus, (value) {
    return _then(_self.copyWith(currentStatus: value));
  });
}
}

// dart format on
