import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/network/interceptors/app_interceptor.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/server_config_provider.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio authenticatedDio(Ref ref) {
  final baseUrl = ref.watch(
    serverConfigProvider.select((asyncValue) {
      if (asyncValue.hasValue) return asyncValue.value!.apiBaseUrl;
      final previous = asyncValue.asData?.value;
      if (previous != null) return previous.apiBaseUrl;
      return AppConstants.baseUrl;
    })
  );

  String cleanBaseUrl = baseUrl;
  if (cleanBaseUrl.endsWith('/')) {
    cleanBaseUrl = cleanBaseUrl.substring(0, cleanBaseUrl.length - 1);
  }

  if (kDebugMode) {
    debugPrint('🌐 [AUTHED DIO] Initializing with BaseURL: $cleanBaseUrl');
  }

  final dio = Dio(BaseOptions(
    baseUrl: cleanBaseUrl,
    connectTimeout: AppConstants.connectTimeout,
    receiveTimeout: AppConstants.receiveTimeout,
    sendTimeout: AppConstants.connectTimeout,
    validateStatus: (status) => status != null && status < 500,
  ));

  dio.interceptors.add(AppInterceptor(ref));

  return dio;
}
