import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/server_config.dart';

part 'server_config_provider.g.dart';

@Riverpod(keepAlive: true)
class ServerConfigNotifier extends _$ServerConfigNotifier {
  static const _modeKey = 'server_mode';
  static const _localIpKey = 'local_server_ip';

  @override
  FutureOr<ServerConfig> build() async {
    final prefs = await SharedPreferences.getInstance();
    final modeIndex = prefs.getInt(_modeKey) ?? 0;
    final localIp = prefs.getString(_localIpKey) ?? '';

    return ServerConfig(mode: ServerMode.values[modeIndex], localIp: localIp);
  }

  Future<void> setMode(ServerMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_modeKey, mode.index);
    state = AsyncData(state.value!.copyWith(mode: mode));
  }

  Future<void> setLocalIp(String ip) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localIpKey, ip);
    state = AsyncData(state.value!.copyWith(localIp: ip));
  }

  String get activeBaseUrl {
    final config = state.value;
    if (config == null || config.mode == ServerMode.cloud) {
      return AppConstants.baseUrl;
    }
    return 'http://${config.localIp}:8000';
  }

  String get activeMqttHost {
    final config = state.value;
    if (config == null || config.mode == ServerMode.cloud) {
      return AppConstants.mqttHost;
    }
    return config.localIp;
  }
}
