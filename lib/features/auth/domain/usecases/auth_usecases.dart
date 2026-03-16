import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/entities/user_info.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

}

class GoogleLoginUseCase {
  final AuthRepository repository;
  GoogleLoginUseCase(this.repository);
  
  Future<Result<UserInfo>> execute() => repository.signInWithGoogle();
}

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);
  
  Future<void> execute() => repository.logout();
}

class GetAuthStateUseCase {
  final AuthRepository repository;
  GetAuthStateUseCase(this.repository);
  
  UserInfo? execute() => repository.currentUser;
}
