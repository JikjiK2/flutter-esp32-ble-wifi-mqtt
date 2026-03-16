import 'dart:async';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/infrastructure/wifi/wifi_client.dart';

part 'wifi_client_impl.g.dart';

@Riverpod(keepAlive: true)
WifiClient wifiClient(Ref ref) {
  return WifiClientImpl();
}

class WifiClientImpl implements WifiClient {
  @override
  Future<List<WifiScanResult>> scanNetworks() async {
    try {
      final canScan = await WiFiScan.instance.canStartScan(askPermissions: true)
          .timeout(const Duration(seconds: 2), onTimeout: () => CanStartScan.notSupported);
      
      if (canScan == CanStartScan.yes) {
        await WiFiScan.instance.startScan().timeout(const Duration(seconds: 3), onTimeout: () => false);
      }

      final List<WiFiAccessPoint> results = await WiFiScan.instance.getScannedResults()
          .timeout(const Duration(seconds: 3), onTimeout: () => []);
          
      return results.map((e) => WifiScanResult(
        ssid: e.ssid,
        rssi: e.level,
        isSecure: e.capabilities.contains("WPA") || e.capabilities.contains("WEP"),
      )).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> connect(String ssid, {String? password}) async {
    return await WiFiForIoTPlugin.connect(
      ssid, 
      password: password,
      joinOnce: true, 
      security: password != null ? NetworkSecurity.WPA : NetworkSecurity.NONE,
    );
  }

  @override
  Future<void> disconnect() async {
    await WiFiForIoTPlugin.disconnect();
  }

  @override
  Future<void> setForceWifiUsage(bool use) async {
    await WiFiForIoTPlugin.forceWifiUsage(use);
  }
}
