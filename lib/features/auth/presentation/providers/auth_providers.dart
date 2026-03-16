import 'package:flutter_esp32_ble_wifi/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/entities/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return ref.watch(authRepositoryImplProvider.notifier);
}

@Riverpod(keepAlive: true)
AsyncValue<UserInfo?> authState(Ref ref) {
  return ref.watch(authRepositoryImplProvider);
}
