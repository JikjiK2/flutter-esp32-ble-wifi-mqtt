import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';

class AppInterceptor extends Interceptor {
  final Ref _ref;

  AppInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final authRepo = _ref.read(authRepositoryProvider);
    final String? token = await authRepo.token;
    
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = '${AppConstants.authPrefix}$token';
    }
    
    AppLogger.d('${options.method} ${options.uri}', tag: 'NETWORK-REQ');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.i('${response.statusCode} ${response.requestOptions.uri}', tag: 'NETWORK-RES');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final appException = _mapToAppException(err);

    if (err.response?.statusCode == 401) {
      AppLogger.w('Unauthorized (401) detected. Attempting token refresh...', tag: 'AUTH');
      
      try {
        await _ref.read(authRepositoryProvider).logout();

        return handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: const AppException.unauthorized('세션이 만료되어 다시 로그인이 필요합니다.'),
        ));
      } catch (e) {
        return handler.reject(err);
      }
    }

    AppLogger.e('Type: ${err.type} | Msg: ${err.message}', tag: 'NETWORK-ERR');

    return handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: appException,
    ));
  }

  AppException _mapToAppException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const AppException.network();
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode == 401) return const AppException.unauthorized();
        if (statusCode == 404) return const AppException.server('요청하신 데이터를 찾을 수 없습니다.');
        return AppException.server('서버 응답 오류 ($statusCode)');
      default:
        return const AppException.unknown();
    }
  }
}
