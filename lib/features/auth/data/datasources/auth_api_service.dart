import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/server_config_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/data/models/auth_models.dart';

part 'auth_api_service.g.dart';

@Riverpod(keepAlive: true)
Dio authDio(Ref ref) {
  final baseUrl = ref.watch(
    serverConfigProvider.select((asyncValue) {
      if (asyncValue.hasValue) {
        return asyncValue.value!.apiBaseUrl;
      }
      final previousData = asyncValue.asData?.value;
      if (previousData != null) {
        return previousData.apiBaseUrl;
      }
      return AppConstants.baseUrl;
    }),
  );

  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
    ),
  );
}

@riverpod
AuthApiService authApiService(Ref ref) {
  final dio = ref.watch(authDioProvider);
  return AuthApiService(dio);
}

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<User> getMe(String token) async {
    final response = await _dio.get(
      '/auth/me',
      options: Options(
        headers: {'Authorization': '${AppConstants.authPrefix}$token'},
      ),
    );
    return User.fromJson(response.data);
  }

  Future<Map<String, dynamic>> checkEmail(String email) async {
    final response = await _dio.get(
      '/auth/check-email',
      queryParameters: {'email': email},
    );
    return response.data;
  }

  Future<Token> loginWithGoogle(String idToken) async {
    final response = await _dio.post(
      '/auth/google',
      data: {'id_token': idToken},
    );
    return Token.fromJson(response.data);
  }
}
