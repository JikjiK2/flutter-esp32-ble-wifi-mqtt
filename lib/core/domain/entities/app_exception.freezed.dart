// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException implements DiagnosticableTreeMixin {

 String? get message;
/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<AppException> get copyWith => _$AppExceptionCopyWithImpl<AppException>(this as AppException, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppExceptionCopyWith<$Res>  {
  factory $AppExceptionCopyWith(AppException value, $Res Function(AppException) _then) = _$AppExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AppExceptionCopyWithImpl<$Res>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._self, this._then);

  final AppException _self;
  final $Res Function(AppException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkException value)?  network,TResult Function( ServerException value)?  server,TResult Function( UnauthorizedException value)?  unauthorized,TResult Function( ParseException value)?  parse,TResult Function( BusinessException value)?  business,TResult Function( UnknownException value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that);case ServerException() when server != null:
return server(_that);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that);case ParseException() when parse != null:
return parse(_that);case BusinessException() when business != null:
return business(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkException value)  network,required TResult Function( ServerException value)  server,required TResult Function( UnauthorizedException value)  unauthorized,required TResult Function( ParseException value)  parse,required TResult Function( BusinessException value)  business,required TResult Function( UnknownException value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkException():
return network(_that);case ServerException():
return server(_that);case UnauthorizedException():
return unauthorized(_that);case ParseException():
return parse(_that);case BusinessException():
return business(_that);case UnknownException():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkException value)?  network,TResult? Function( ServerException value)?  server,TResult? Function( UnauthorizedException value)?  unauthorized,TResult? Function( ParseException value)?  parse,TResult? Function( BusinessException value)?  business,TResult? Function( UnknownException value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that);case ServerException() when server != null:
return server(_that);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that);case ParseException() when parse != null:
return parse(_that);case BusinessException() when business != null:
return business(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  network,TResult Function( String? message)?  server,TResult Function( String? message)?  unauthorized,TResult Function( String? message)?  parse,TResult Function( String? message)?  business,TResult Function( String? message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that.message);case ServerException() when server != null:
return server(_that.message);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that.message);case ParseException() when parse != null:
return parse(_that.message);case BusinessException() when business != null:
return business(_that.message);case UnknownException() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  network,required TResult Function( String? message)  server,required TResult Function( String? message)  unauthorized,required TResult Function( String? message)  parse,required TResult Function( String? message)  business,required TResult Function( String? message)  unknown,}) {final _that = this;
switch (_that) {
case NetworkException():
return network(_that.message);case ServerException():
return server(_that.message);case UnauthorizedException():
return unauthorized(_that.message);case ParseException():
return parse(_that.message);case BusinessException():
return business(_that.message);case UnknownException():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  network,TResult? Function( String? message)?  server,TResult? Function( String? message)?  unauthorized,TResult? Function( String? message)?  parse,TResult? Function( String? message)?  business,TResult? Function( String? message)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that.message);case ServerException() when server != null:
return server(_that.message);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that.message);case ParseException() when parse != null:
return parse(_that.message);case BusinessException() when business != null:
return business(_that.message);case UnknownException() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NetworkException extends AppException with DiagnosticableTreeMixin {
  const NetworkException([this.message]): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException.network'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException.network(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(NetworkException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ServerException extends AppException with DiagnosticableTreeMixin {
  const ServerException([this.message]): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException.server'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException.server(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ServerException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnauthorizedException extends AppException with DiagnosticableTreeMixin {
  const UnauthorizedException([this.message]): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedExceptionCopyWith<UnauthorizedException> get copyWith => _$UnauthorizedExceptionCopyWithImpl<UnauthorizedException>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException.unauthorized'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $UnauthorizedExceptionCopyWith(UnauthorizedException value, $Res Function(UnauthorizedException) _then) = _$UnauthorizedExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$UnauthorizedExceptionCopyWithImpl<$Res>
    implements $UnauthorizedExceptionCopyWith<$Res> {
  _$UnauthorizedExceptionCopyWithImpl(this._self, this._then);

  final UnauthorizedException _self;
  final $Res Function(UnauthorizedException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(UnauthorizedException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ParseException extends AppException with DiagnosticableTreeMixin {
  const ParseException([this.message]): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParseExceptionCopyWith<ParseException> get copyWith => _$ParseExceptionCopyWithImpl<ParseException>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException.parse'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParseException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException.parse(message: $message)';
}


}

/// @nodoc
abstract mixin class $ParseExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $ParseExceptionCopyWith(ParseException value, $Res Function(ParseException) _then) = _$ParseExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ParseExceptionCopyWithImpl<$Res>
    implements $ParseExceptionCopyWith<$Res> {
  _$ParseExceptionCopyWithImpl(this._self, this._then);

  final ParseException _self;
  final $Res Function(ParseException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ParseException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class BusinessException extends AppException with DiagnosticableTreeMixin {
  const BusinessException([this.message]): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessExceptionCopyWith<BusinessException> get copyWith => _$BusinessExceptionCopyWithImpl<BusinessException>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException.business'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException.business(message: $message)';
}


}

/// @nodoc
abstract mixin class $BusinessExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $BusinessExceptionCopyWith(BusinessException value, $Res Function(BusinessException) _then) = _$BusinessExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$BusinessExceptionCopyWithImpl<$Res>
    implements $BusinessExceptionCopyWith<$Res> {
  _$BusinessExceptionCopyWithImpl(this._self, this._then);

  final BusinessException _self;
  final $Res Function(BusinessException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(BusinessException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnknownException extends AppException with DiagnosticableTreeMixin {
  const UnknownException([this.message]): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownExceptionCopyWith<UnknownException> get copyWith => _$UnknownExceptionCopyWithImpl<UnknownException>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppException.unknown'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppException.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $UnknownExceptionCopyWith(UnknownException value, $Res Function(UnknownException) _then) = _$UnknownExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$UnknownExceptionCopyWithImpl<$Res>
    implements $UnknownExceptionCopyWith<$Res> {
  _$UnknownExceptionCopyWithImpl(this._self, this._then);

  final UnknownException _self;
  final $Res Function(UnknownException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(UnknownException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
