import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entity.freezed.dart';

@freezed
sealed class CommunicationLog with _$CommunicationLog {
  const factory CommunicationLog({
    required List<String> rxLogs,
    required List<String> txLogs,
    @Default(false) bool isExpanded,
  }) = _CommunicationLog;
}
