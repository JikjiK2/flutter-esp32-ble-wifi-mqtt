import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/global_error_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/domain/entities/user_info.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_usecase_providers.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<UserInfo?> build() async {
    final useCase = ref.watch(getAuthStateUseCaseProvider);
    return useCase.execute();
  }

  Future<void> googleLogin() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await ref.read(googleLoginUseCaseProvider).execute();

      return switch (result) {
        Success(data: final data) => data,
        Failure(exception: final e) => throw e,
      };
    });

    if (state.hasError) {
      final error = state.error!;

      if (error is PlatformException &&
          (error.code == 'sign_in_canceled' || error.code == '12501')) {
        state = const AsyncData(null);
      } else {
        final appException = error is AppException
            ? error
            : _mapToAppException(error);

        ref.read(globalErrorProvider.notifier).showError(appException);
      }
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.wait([
        ref.read(logoutUseCaseProvider).execute(),
        Future.delayed(const Duration(milliseconds: 800)),
      ]);
      return null;
    });
  }

  AppException _mapToAppException(Object error) {
    final errorStr = error.toString().toLowerCase();

    if (error is SocketException ||
        errorStr.contains('network') ||
        errorStr.contains('connection')) {
      return const AppException.network();
    }

    if (errorStr.contains('401') || errorStr.contains('unauthorized')) {
      return const AppException.unauthorized();
    }

    if (errorStr.contains('500') || errorStr.contains('server')) {
      return const AppException.server();
    }

    return AppException.unknown(error.toString());
  }
}
