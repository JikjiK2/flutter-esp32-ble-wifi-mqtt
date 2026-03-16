import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
sealed class AppException with _$AppException implements Exception {
  const factory AppException.network([String? message]) = NetworkException;

  const factory AppException.server([String? message]) = ServerException;

  const factory AppException.unauthorized([String? message]) =
      UnauthorizedException;

  const factory AppException.parse([String? message]) = ParseException;

  const factory AppException.business([String? message]) = BusinessException;

  const factory AppException.unknown([String? message]) = UnknownException;

  const AppException._();

  String get readableMessage {
    return when(
      network: (msg) => msg ?? '네트워크 연결이 원활하지 않습니다.',
      server: (msg) => msg ?? '서버 응답 중 오류가 발생했습니다.',
      unauthorized: (msg) => msg ?? '인증 정보가 만료되었습니다. 다시 로그인해주세요.',
      parse: (msg) => msg ?? '데이터 처리 중 오류가 발생했습니다.',
      business: (msg) => msg ?? '요청을 처리할 수 없습니다.',
      unknown: (msg) {
        if (kDebugMode) return msg ?? '알 수 없는 오류가 발생했습니다.';
        return '시스템 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.';
      },
    );
  }
}
