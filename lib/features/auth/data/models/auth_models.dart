import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/entities/user_info.dart';

part 'auth_models.freezed.dart';

part 'auth_models.g.dart';

int _idFromJson(dynamic id) {
  if (id == null) return 0;
  if (id is int) return id;
  if (id is String) return int.tryParse(id) ?? 0;
  return 0;
}

@freezed
sealed class User with _$User {
  const factory User({
    @JsonKey(fromJson: _idFromJson) @Default(0) int id,
    required String email,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    String? displayName,
    String? photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserMapper on User {
  UserInfo toEntity() {
    return UserInfo(email: email, displayName: displayName, photoUrl: photoUrl);
  }
}

@freezed
sealed class UserCreate with _$UserCreate {
  const factory UserCreate({required String email, required String password}) =
      _UserCreate;

  factory UserCreate.fromJson(Map<String, dynamic> json) =>
      _$UserCreateFromJson(json);
}

@freezed
sealed class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String username,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
sealed class Token with _$Token {
  const factory Token({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
