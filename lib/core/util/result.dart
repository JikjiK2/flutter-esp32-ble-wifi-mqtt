import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppException exception) = Failure<T>;

  static Future<Result<T>> guard<T>(Future<T> Function() future) async {
    try {
      return Result.success(await future());
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppException.unknown(e.toString()));
    }
  }
}
