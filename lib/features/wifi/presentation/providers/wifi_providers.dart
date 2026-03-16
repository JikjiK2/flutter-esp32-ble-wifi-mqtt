import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/log_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/repositories/wifi_repository.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_usecase_providers.dart';

part 'wifi_providers.g.dart';

@Riverpod(keepAlive: true)
WifiRepository wifiRepository(Ref ref) {
  throw UnimplementedError(
    'wifiRepositoryProvider must be overridden in main.dart',
  );
}

class SavedDeviceInfoData {
  final String? ssid;
  final String? deviceIp;
  final String? deviceId;

  SavedDeviceInfoData({this.ssid, this.deviceIp, this.deviceId});
}

@Riverpod(keepAlive: true)
class SavedDeviceInfo extends _$SavedDeviceInfo {
  @override
  FutureOr<SavedDeviceInfoData> build() async {
    final prefs = await SharedPreferences.getInstance();
    return SavedDeviceInfoData(
      ssid: prefs.getString('last_connected_ssid'),
      deviceIp: prefs.getString('last_device_ip'),
      deviceId: prefs.getString('last_device_id'),
    );
  }

  Future<void> save({
    required String ssid,
    String? deviceIp,
    String? deviceId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_connected_ssid', ssid);
    if (deviceIp != null) await prefs.setString('last_device_ip', deviceIp);
    if (deviceId != null) await prefs.setString('last_device_id', deviceId);
    ref.invalidateSelf();
    await future;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('last_connected_ssid');
    await prefs.remove('last_device_ip');
    await prefs.remove('last_device_id');
    ref.invalidateSelf();
  }
}

@Riverpod(keepAlive: true)
class WifiDataLog extends _$WifiDataLog {
  static const int _maxLogCount = 50;
  StreamSubscription? _logSubscription;

  @override
  CommunicationLog build() {
    final watchUseCase = ref.watch(watchWifiLogUseCaseProvider);

    _logSubscription?.cancel();

    _logSubscription = watchUseCase.execute().listen((log) {
      if (log.startsWith("TX:")) {
        addTx(log.substring(3).trim());
      } else if (log.startsWith("RX:")) {
        addRx(log.substring(3).trim());
      } else if (log.startsWith("ERROR:")) {
        addError(log.substring(6).trim());
      } else if (log.startsWith("INFO:")) {
        addTx("ℹ️ ${log.substring(5).trim()}");
      }
    });

    ref.onDispose(() => _logSubscription?.cancel());

    return const CommunicationLog(rxLogs: [], txLogs: []);
  }

  void addTx(String msg) {
    state = state.copyWith(
      txLogs: [msg, ...state.txLogs.take(_maxLogCount - 1)],
    );
  }

  void addRx(String msg) {
    state = state.copyWith(
      rxLogs: [msg, ...state.rxLogs.take(_maxLogCount - 1)],
    );
  }

  void addError(String msg) {
    addRx("❌ $msg");
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void clearLogs() {
    state = const CommunicationLog(rxLogs: [], txLogs: []);
  }
}
