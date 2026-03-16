// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunicationLog {

 List<String> get rxLogs; List<String> get txLogs; bool get isExpanded;
/// Create a copy of CommunicationLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunicationLogCopyWith<CommunicationLog> get copyWith => _$CommunicationLogCopyWithImpl<CommunicationLog>(this as CommunicationLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunicationLog&&const DeepCollectionEquality().equals(other.rxLogs, rxLogs)&&const DeepCollectionEquality().equals(other.txLogs, txLogs)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rxLogs),const DeepCollectionEquality().hash(txLogs),isExpanded);

@override
String toString() {
  return 'CommunicationLog(rxLogs: $rxLogs, txLogs: $txLogs, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class $CommunicationLogCopyWith<$Res>  {
  factory $CommunicationLogCopyWith(CommunicationLog value, $Res Function(CommunicationLog) _then) = _$CommunicationLogCopyWithImpl;
@useResult
$Res call({
 List<String> rxLogs, List<String> txLogs, bool isExpanded
});




}
/// @nodoc
class _$CommunicationLogCopyWithImpl<$Res>
    implements $CommunicationLogCopyWith<$Res> {
  _$CommunicationLogCopyWithImpl(this._self, this._then);

  final CommunicationLog _self;
  final $Res Function(CommunicationLog) _then;

/// Create a copy of CommunicationLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rxLogs = null,Object? txLogs = null,Object? isExpanded = null,}) {
  return _then(_self.copyWith(
rxLogs: null == rxLogs ? _self.rxLogs : rxLogs // ignore: cast_nullable_to_non_nullable
as List<String>,txLogs: null == txLogs ? _self.txLogs : txLogs // ignore: cast_nullable_to_non_nullable
as List<String>,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunicationLog].
extension CommunicationLogPatterns on CommunicationLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunicationLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunicationLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunicationLog value)  $default,){
final _that = this;
switch (_that) {
case _CommunicationLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunicationLog value)?  $default,){
final _that = this;
switch (_that) {
case _CommunicationLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> rxLogs,  List<String> txLogs,  bool isExpanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunicationLog() when $default != null:
return $default(_that.rxLogs,_that.txLogs,_that.isExpanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> rxLogs,  List<String> txLogs,  bool isExpanded)  $default,) {final _that = this;
switch (_that) {
case _CommunicationLog():
return $default(_that.rxLogs,_that.txLogs,_that.isExpanded);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> rxLogs,  List<String> txLogs,  bool isExpanded)?  $default,) {final _that = this;
switch (_that) {
case _CommunicationLog() when $default != null:
return $default(_that.rxLogs,_that.txLogs,_that.isExpanded);case _:
  return null;

}
}

}

/// @nodoc


class _CommunicationLog implements CommunicationLog {
  const _CommunicationLog({required final  List<String> rxLogs, required final  List<String> txLogs, this.isExpanded = false}): _rxLogs = rxLogs,_txLogs = txLogs;
  

 final  List<String> _rxLogs;
@override List<String> get rxLogs {
  if (_rxLogs is EqualUnmodifiableListView) return _rxLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rxLogs);
}

 final  List<String> _txLogs;
@override List<String> get txLogs {
  if (_txLogs is EqualUnmodifiableListView) return _txLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_txLogs);
}

@override@JsonKey() final  bool isExpanded;

/// Create a copy of CommunicationLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunicationLogCopyWith<_CommunicationLog> get copyWith => __$CommunicationLogCopyWithImpl<_CommunicationLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunicationLog&&const DeepCollectionEquality().equals(other._rxLogs, _rxLogs)&&const DeepCollectionEquality().equals(other._txLogs, _txLogs)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rxLogs),const DeepCollectionEquality().hash(_txLogs),isExpanded);

@override
String toString() {
  return 'CommunicationLog(rxLogs: $rxLogs, txLogs: $txLogs, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class _$CommunicationLogCopyWith<$Res> implements $CommunicationLogCopyWith<$Res> {
  factory _$CommunicationLogCopyWith(_CommunicationLog value, $Res Function(_CommunicationLog) _then) = __$CommunicationLogCopyWithImpl;
@override @useResult
$Res call({
 List<String> rxLogs, List<String> txLogs, bool isExpanded
});




}
/// @nodoc
class __$CommunicationLogCopyWithImpl<$Res>
    implements _$CommunicationLogCopyWith<$Res> {
  __$CommunicationLogCopyWithImpl(this._self, this._then);

  final _CommunicationLog _self;
  final $Res Function(_CommunicationLog) _then;

/// Create a copy of CommunicationLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rxLogs = null,Object? txLogs = null,Object? isExpanded = null,}) {
  return _then(_CommunicationLog(
rxLogs: null == rxLogs ? _self._rxLogs : rxLogs // ignore: cast_nullable_to_non_nullable
as List<String>,txLogs: null == txLogs ? _self._txLogs : txLogs // ignore: cast_nullable_to_non_nullable
as List<String>,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
