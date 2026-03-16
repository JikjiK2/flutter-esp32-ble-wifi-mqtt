import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_config_entity.freezed.dart';

part 'wifi_config_entity.g.dart';

@freezed
sealed class WifiConfig with _$WifiConfig {
  const factory WifiConfig({
    required String deviceId,
    required String ssid,
    required String password,
    String? apPw,
  }) = _WifiConfig;

  factory WifiConfig.fromJson(Map<String, dynamic> json) =>
      _$WifiConfigFromJson(json);
}
