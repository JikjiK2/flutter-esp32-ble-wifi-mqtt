import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/infrastructure/wifi/wifi_client.dart'; import 'package:flutter_esp32_ble_wifi/core/infrastructure/wifi/wifi_client_impl.dart'; import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';

part 'wifi_native_datasource.g.dart';

abstract class WifiNativeDataSource {
  Future<List<MqttSetupNetwork>> scanNearbyDevices();
  Future<bool> connectToDevice(String ssid);
  Future<void> disconnectFromDevice();
  Future<void> setForceWifiUsage(bool use);
}

@Riverpod(keepAlive: true)
WifiNativeDataSource wifiNativeDataSource(Ref ref) {
    final wifiClient = ref.watch(wifiClientProvider);
  return WifiNativeDataSourceImpl(wifiClient);
}

class WifiNativeDataSourceImpl implements WifiNativeDataSource {
  final WifiClient _wifiClient;

  WifiNativeDataSourceImpl(this._wifiClient);

  @override
  Future<List<MqttSetupNetwork>> scanNearbyDevices() async {
    final results = await _wifiClient.scanNetworks();
    return results.map((e) => MqttSetupNetwork(
      ssid: e.ssid,
      rssi: e.rssi,
      isSecure: e.isSecure,
    )).toList();
  }

  @override
  Future<bool> connectToDevice(String ssid) async {
        return await _wifiClient.connect(ssid);
  }

  @override
  Future<void> disconnectFromDevice() async {
    await _wifiClient.disconnect();
  }

  @override
  Future<void> setForceWifiUsage(bool use) async {
    await _wifiClient.setForceWifiUsage(use);
  }
}
