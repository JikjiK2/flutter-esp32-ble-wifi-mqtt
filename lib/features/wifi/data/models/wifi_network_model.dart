import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_network_entity.dart';

class WifiNetworkModel {
  final String ssid;
  final int rssi;
  final bool isSecure;

  WifiNetworkModel({
    required this.ssid,
    required this.rssi,
    required this.isSecure,
  });

  factory WifiNetworkModel.fromJson(Map<String, dynamic> json) {
    return WifiNetworkModel(
      ssid: json['ssid'] ?? 'Unknown',
      rssi: json['rssi'] ?? -100,
      isSecure: json['secure'] ?? true,
    );
  }

  WifiNetwork toEntity() {
    return WifiNetwork(ssid: ssid, rssi: rssi, isSecure: isSecure);
  }
}
