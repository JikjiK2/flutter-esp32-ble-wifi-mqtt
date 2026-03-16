import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_network_entity.freezed.dart';

@freezed
sealed class WifiNetwork with _$WifiNetwork {
  const factory WifiNetwork({
    required String ssid,
    required int rssi,
    required bool isSecure,
  }) = _WifiNetwork;
}
