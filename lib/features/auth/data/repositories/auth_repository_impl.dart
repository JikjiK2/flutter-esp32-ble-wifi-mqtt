import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/data/datasources/auth_api_service.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/data/models/auth_models.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/entities/user_info.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/repositories/auth_repository.dart' as domain;

part 'auth_repository_impl.g.dart';

@Riverpod(keepAlive: true)
class AuthRepositoryImpl extends _$AuthRepositoryImpl implements domain.AuthRepository {

  AuthApiService get _apiService => ref.read(authApiServiceProvider);
  AuthLocalDataSource get _localDataSource => ref.read(authLocalDataSourceProvider.notifier);

  @override
  UserInfo? get currentUser => state.value;

  @override
  FutureOr<UserInfo?> build() async {
    await _initializeGoogleSignIn();
    return await _fetchInitialUser();
  }

  Future<UserInfo?> _fetchInitialUser() async {
    try {
      final tokenValue = await _localDataSource.getToken();
      if (tokenValue == null || tokenValue.isEmpty) return null;

      AppLogger.i('Validating session with server...', tag: 'AUTH');

      final userModel = await _apiService.getMe(tokenValue);

      AppLogger.i('Session validated for: ${userModel.email}', tag: 'AUTH');
      return userModel.toEntity();
    } catch (e) {
      AppLogger.w('Session invalid or expired: $e', tag: 'AUTH');
      return null;
    }
  }

  @override
  Future<String?> get token => _localDataSource.getToken();

  @override
  Future<void> initialize() async {
    state = AsyncData(await _fetchInitialUser());
  }

  @override
  Future<Result<UserInfo>> signInWithGoogle() async {

    return await Result.guard(() async {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

      final GoogleSignInAuthentication auth = googleUser.authentication;
      final String? idToken = auth.idToken;

      if (idToken == null) throw const AppException.network("ID 토큰을 가져올 수 없습니다.");

      final tokenData = await _apiService.loginWithGoogle(idToken);
      await _localDataSource.saveToken(tokenData.accessToken);

      final userModel = await _apiService.getMe(tokenData.accessToken);
      final user = userModel.toEntity();

      state = AsyncData(user);
      return user;
    });
  }

  @override
  Future<void> logout() async {
    AppLogger.i('Logging out user...', tag: 'AUTH');
    await _localDataSource.removeToken();
    try { await GoogleSignIn.instance.signOut(); } catch (_) {}
    state = const AsyncData(null);
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      final String? serverClientId = dotenv.env['GOOGLE_CLIENT_ID_WEB'];
      if (serverClientId != null) {
        await GoogleSignIn.instance.initialize(serverClientId: serverClientId);
      }
    } catch (e) {
      AppLogger.e("Google SDK Init Error: $e", tag: 'AUTH');
    }
  }
}
