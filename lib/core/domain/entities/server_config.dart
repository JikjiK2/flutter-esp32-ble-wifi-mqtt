import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_config.freezed.dart';

enum ServerMode { cloud, local }

@freezed
sealed class ServerConfig with _$ServerConfig {
  const factory ServerConfig({
    @Default(ServerMode.cloud) ServerMode mode,
    @Default('') String localIp,
  }) = _ServerConfig;
}
