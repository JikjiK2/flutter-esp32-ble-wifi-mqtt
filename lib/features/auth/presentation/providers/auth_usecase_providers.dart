import 'package:flutter_esp32_ble_wifi/features/auth/domain/usecases/auth_usecases.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecase_providers.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) =>
    LoginUseCase(ref.watch(authRepositoryProvider));

@riverpod
GoogleLoginUseCase googleLoginUseCase(Ref ref) =>
    GoogleLoginUseCase(ref.watch(authRepositoryProvider));

@riverpod
LogoutUseCase logoutUseCase(Ref ref) =>
    LogoutUseCase(ref.watch(authRepositoryProvider));

@riverpod
GetAuthStateUseCase getAuthStateUseCase(Ref ref) =>
    GetAuthStateUseCase(ref.watch(authRepositoryProvider));
