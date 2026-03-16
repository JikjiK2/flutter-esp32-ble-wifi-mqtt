// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] == null ? 0 : _idFromJson(json['id']),
  email: json['email'] as String,
  isActive: json['is_active'] as bool? ?? true,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'is_active': instance.isActive,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
};

_UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => _UserCreate(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$UserCreateToJson(_UserCreate instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

_Token _$TokenFromJson(Map<String, dynamic> json) => _Token(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  refreshToken: json['refresh_token'] as String?,
);

Map<String, dynamic> _$TokenToJson(_Token instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'refresh_token': instance.refreshToken,
};
