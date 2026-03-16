import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/entities/user_info.dart';

abstract class AuthRepository {
  UserInfo? get currentUser;

  Future<String?> get token;

  Future<void> initialize();

  Future<Result<UserInfo>> signInWithGoogle();

  Future<void> logout();
}
