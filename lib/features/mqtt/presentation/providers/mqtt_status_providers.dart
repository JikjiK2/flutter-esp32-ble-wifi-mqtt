import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_providers.dart';

part 'mqtt_status_providers.g.dart';

@riverpod
Stream<Map<String, LampStatus>> mqttMultiDeviceStatus(Ref ref) {
  return ref.watch(mqttRepositoryProvider).multiDeviceStatusStream;
}

@riverpod
Stream<LampStatus> mqttLampStatus(Ref ref, String deviceId) {
  return ref
      .watch(mqttRepositoryProvider)
      .multiDeviceStatusStream
      .map((devices) => devices[deviceId] ?? LampStatus.initial());
}

@Riverpod(keepAlive: true)
Stream<ConnectionStatus> mqttConnectionStatus(Ref ref, String deviceId) {
  return ref.watch(mqttRepositoryProvider).connectionStatusStream;
}

@riverpod
Stream<List<MqttSetupNetwork>> mqttRemoteWifiScanResults(Ref ref) async* {
  final repository = ref.watch(mqttRepositoryProvider);

  await for (final log in repository.rawLogStream) {
    if (log.startsWith("RX:")) {
      try {
        final rawJson = log.substring(3).trim();
        final data = jsonDecode(rawJson);
        if (data['type'] == 'wifi_list') {
          final List<dynamic> list = data['networks'] ?? [];
          yield list
              .map(
                (json) => MqttSetupNetwork(
                  ssid: json['ssid'] ?? 'Unknown',
                  rssi: json['rssi'] ?? -100,
                  isSecure: json['secure'] ?? true,
                ),
              )
              .toList();
        }
      } catch (_) {}
    }
  }
}
