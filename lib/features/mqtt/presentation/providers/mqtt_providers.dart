import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/log_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/repositories/mqtt_repository.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_usecase_providers.dart';

part 'mqtt_providers.g.dart';

@Riverpod(keepAlive: true)
MqttRepository mqttRepository(Ref ref) {
  throw UnimplementedError(
    'mqttRepositoryProvider must be overridden in main.dart',
  );
}

class SavedMqttInfoData {
  final String? lastBrokerIp;
  final String? lastDeviceId;

  SavedMqttInfoData({this.lastBrokerIp, this.lastDeviceId});
}

@Riverpod(keepAlive: true)
class SavedMqttInfo extends _$SavedMqttInfo {
  @override
  FutureOr<SavedMqttInfoData> build() async {
    final prefs = await SharedPreferences.getInstance();
    return SavedMqttInfoData(
      lastBrokerIp: prefs.getString('last_mqtt_broker_ip'),
      lastDeviceId: prefs.getString('last_mqtt_device_id'),
    );
  }

  Future<void> save({
    required String brokerIp,
    required String deviceId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_mqtt_broker_ip', brokerIp);
    await prefs.setString('last_mqtt_device_id', deviceId);
    ref.invalidateSelf();
    await future;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('last_mqtt_broker_ip');
    await prefs.remove('last_mqtt_device_id');
    ref.invalidateSelf();
  }
}

@Riverpod(keepAlive: true)
class MqttDataLog extends _$MqttDataLog {
  static const int _maxLogCount = 50;
  StreamSubscription? _logSubscription;

  @override
  CommunicationLog build() {
    final watchUseCase = ref.watch(watchMqttLogUseCaseProvider);

    _logSubscription?.cancel();

    _logSubscription = watchUseCase.execute().listen((log) {
      if (log.startsWith("TX:")) {
        addTx(log.substring(3));
      } else if (log.startsWith("RX:")) {
        addRx(log.substring(3));
      } else if (log.startsWith("ERROR:")) {
        addError(log.substring(6));
      } else if (log.startsWith("INFO:")) {
        addTx("ℹ️ ${log.substring(5)}");
      }
    });

    ref.onDispose(() => _logSubscription?.cancel());

    return const CommunicationLog(rxLogs: [], txLogs: []);
  }

  void addTx(String msg) {
    state = state.copyWith(
      txLogs: [msg.trim(), ...state.txLogs.take(_maxLogCount - 1)],
    );
  }

  void addRx(String msg) {
    state = state.copyWith(
      rxLogs: [msg.trim(), ...state.rxLogs.take(_maxLogCount - 1)],
    );
  }

  void addError(String msg) {
    addRx("❌ ${msg.trim()}");
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void clearLogs() {
    state = const CommunicationLog(rxLogs: [], txLogs: []);
  }
}
