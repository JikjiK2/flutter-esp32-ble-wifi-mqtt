import 'dart:async';

abstract class WifiClient {
  Future<List<WifiScanResult>> scanNetworks();

  Future<bool> connect(String ssid, {String? password});

  Future<void> disconnect();

  Future<void> setForceWifiUsage(bool use);
}

class WifiScanResult {
  final String ssid;
  final int rssi;
  final bool isSecure;

  WifiScanResult({
    required this.ssid,
    required this.rssi,
    required this.isSecure,
  });
}
