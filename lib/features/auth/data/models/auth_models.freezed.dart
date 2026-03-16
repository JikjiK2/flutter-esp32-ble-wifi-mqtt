// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@JsonKey(fromJson: _idFromJson) int get id; String get email;@JsonKey(name: 'is_active') bool get isActive; String? get displayName; String? get photoUrl;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,isActive,displayName,photoUrl);

@override
String toString() {
  return 'User(id: $id, email: $email, isActive: $isActive, displayName: $displayName, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _idFromJson) int id, String email,@JsonKey(name: 'is_active') bool isActive, String? displayName, String? photoUrl
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? isActive = null,Object? displayName = freezed,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _idFromJson)  int id,  String email, @JsonKey(name: 'is_active')  bool isActive,  String? displayName,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.isActive,_that.displayName,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _idFromJson)  int id,  String email, @JsonKey(name: 'is_active')  bool isActive,  String? displayName,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.isActive,_that.displayName,_that.photoUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _idFromJson)  int id,  String email, @JsonKey(name: 'is_active')  bool isActive,  String? displayName,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.isActive,_that.displayName,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({@JsonKey(fromJson: _idFromJson) this.id = 0, required this.email, @JsonKey(name: 'is_active') this.isActive = true, this.displayName, this.photoUrl});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(fromJson: _idFromJson) final  int id;
@override final  String email;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override final  String? displayName;
@override final  String? photoUrl;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,isActive,displayName,photoUrl);

@override
String toString() {
  return 'User(id: $id, email: $email, isActive: $isActive, displayName: $displayName, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _idFromJson) int id, String email,@JsonKey(name: 'is_active') bool isActive, String? displayName, String? photoUrl
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? isActive = null,Object? displayName = freezed,Object? photoUrl = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserCreate {

 String get email; String get password;
/// Create a copy of UserCreate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreateCopyWith<UserCreate> get copyWith => _$UserCreateCopyWithImpl<UserCreate>(this as UserCreate, _$identity);

  /// Serializes this UserCreate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreate&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'UserCreate(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserCreateCopyWith<$Res>  {
  factory $UserCreateCopyWith(UserCreate value, $Res Function(UserCreate) _then) = _$UserCreateCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$UserCreateCopyWithImpl<$Res>
    implements $UserCreateCopyWith<$Res> {
  _$UserCreateCopyWithImpl(this._self, this._then);

  final UserCreate _self;
  final $Res Function(UserCreate) _then;

/// Create a copy of UserCreate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCreate].
extension UserCreatePatterns on UserCreate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCreate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCreate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCreate value)  $default,){
final _that = this;
switch (_that) {
case _UserCreate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCreate value)?  $default,){
final _that = this;
switch (_that) {
case _UserCreate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCreate() when $default != null:
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _UserCreate():
return $default(_that.email,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _UserCreate() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCreate implements UserCreate {
  const _UserCreate({required this.email, required this.password});
  factory _UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of UserCreate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreateCopyWith<_UserCreate> get copyWith => __$UserCreateCopyWithImpl<_UserCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreate&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'UserCreate(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UserCreateCopyWith<$Res> implements $UserCreateCopyWith<$Res> {
  factory _$UserCreateCopyWith(_UserCreate value, $Res Function(_UserCreate) _then) = __$UserCreateCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$UserCreateCopyWithImpl<$Res>
    implements _$UserCreateCopyWith<$Res> {
  __$UserCreateCopyWithImpl(this._self, this._then);

  final _UserCreate _self;
  final $Res Function(_UserCreate) _then;

/// Create a copy of UserCreate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_UserCreate(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginRequest {

 String get username; String get password;
/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<LoginRequest> get copyWith => _$LoginRequestCopyWithImpl<LoginRequest>(this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'LoginRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res>  {
  factory $LoginRequestCopyWith(LoginRequest value, $Res Function(LoginRequest) _then) = _$LoginRequestCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class _$LoginRequestCopyWithImpl<$Res>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginRequest():
return $default(_that.username,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequest implements LoginRequest {
  const _LoginRequest({required this.username, required this.password});
  factory _LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

@override final  String username;
@override final  String password;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'LoginRequest(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_LoginRequest(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Token {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'token_type') String get tokenType;@JsonKey(name: 'refresh_token') String? get refreshToken;
/// Create a copy of Token
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenCopyWith<Token> get copyWith => _$TokenCopyWithImpl<Token>(this as Token, _$identity);

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Token&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenType,refreshToken);

@override
String toString() {
  return 'Token(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $TokenCopyWith<$Res>  {
  factory $TokenCopyWith(Token value, $Res Function(Token) _then) = _$TokenCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'refresh_token') String? refreshToken
});




}
/// @nodoc
class _$TokenCopyWithImpl<$Res>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._self, this._then);

  final Token _self;
  final $Res Function(Token) _then;

/// Create a copy of Token
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? tokenType = null,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Token].
extension TokenPatterns on Token {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Token value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Token() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Token value)  $default,){
final _that = this;
switch (_that) {
case _Token():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Token value)?  $default,){
final _that = this;
switch (_that) {
case _Token() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'refresh_token')  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Token() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'refresh_token')  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _Token():
return $default(_that.accessToken,_that.tokenType,_that.refreshToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'refresh_token')  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _Token() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Token implements Token {
  const _Token({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'token_type') required this.tokenType, @JsonKey(name: 'refresh_token') this.refreshToken});
  factory _Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'token_type') final  String tokenType;
@override@JsonKey(name: 'refresh_token') final  String? refreshToken;

/// Create a copy of Token
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenCopyWith<_Token> get copyWith => __$TokenCopyWithImpl<_Token>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Token&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenType,refreshToken);

@override
String toString() {
  return 'Token(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$TokenCopyWith(_Token value, $Res Function(_Token) _then) = __$TokenCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'refresh_token') String? refreshToken
});




}
/// @nodoc
class __$TokenCopyWithImpl<$Res>
    implements _$TokenCopyWith<$Res> {
  __$TokenCopyWithImpl(this._self, this._then);

  final _Token _self;
  final $Res Function(_Token) _then;

/// Create a copy of Token
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? tokenType = null,Object? refreshToken = freezed,}) {
  return _then(_Token(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
