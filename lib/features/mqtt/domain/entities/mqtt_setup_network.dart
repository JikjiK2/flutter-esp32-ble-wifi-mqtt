import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_setup_network.freezed.dart';

@freezed
sealed class MqttSetupNetwork with _$MqttSetupNetwork {
  const factory MqttSetupNetwork({
    required String ssid,
    required int rssi,
    @Default(false) bool isSecure,
  }) = _MqttSetupNetwork;
}
