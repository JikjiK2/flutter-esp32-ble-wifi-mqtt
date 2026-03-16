import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/config/app_constants.dart';

part 'server_config_provider.freezed.dart';
part 'server_config_provider.g.dart';

enum ServerMode { cloud }

@freezed
sealed class NetworkDiagnosis with _$NetworkDiagnosis {
  const factory NetworkDiagnosis({
    required bool isWifiConnected,
    String? currentSsid,
    required bool isApiReachable,
    String? suggestion,
  }) = _NetworkDiagnosis;
}

@freezed
sealed class ServerConfigState with _$ServerConfigState {
  const factory ServerConfigState({
    required ServerMode mode,
    required String apiBaseUrl,
    required String mqttHost,
    @Default(false) bool isSyncing,
    @Default('') String syncMessage,
    NetworkDiagnosis? lastDiagnosis,
  }) = _ServerConfigState;
}

@Riverpod(keepAlive: true)
class ServerConfig extends _$ServerConfig {
  final _networkInfo = NetworkInfo();

  @override
  FutureOr<ServerConfigState> build() async {

    const mode = ServerMode.cloud;
    
    return ServerConfigState(
      mode: mode,
      apiBaseUrl: getModeApiUrl(mode),
      mqttHost: getModeMqttHost(mode),
    );
  }

  String getModeApiUrl(ServerMode mode) {
    return AppConstants.baseUrl;
  }

  String getModeMqttHost(ServerMode mode) {
    return AppConstants.mqttBaseUrl;
  }

  Future<void> setServerMode(ServerMode mode, {String? customApi, String? customMqtt}) async {
    return; 
  }

  void setSyncStatus({required bool isSyncing, String message = ''}) {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(isSyncing: isSyncing, syncMessage: message));
    }
  }

  Future<List<ConnectivityResult>> getCurrentConnectivity() async {
    return await Connectivity().checkConnectivity();
  }

  Future<NetworkDiagnosis> performDiagnosis() async {
    final connectivity = await getCurrentConnectivity();
    final isWifi = connectivity.contains(ConnectivityResult.wifi);
    String? ssid;
    if (isWifi) ssid = await _networkInfo.getWifiName();

    final currentState = state.value;
    if (currentState == null) return const NetworkDiagnosis(isWifiConnected: false, isApiReachable: false);

    bool apiOk = false;
    try {
      final response = await Dio().get(
        '${currentState.apiBaseUrl}/config/mqtt',
        options: Options(receiveTimeout: const Duration(seconds: 3))
      );
      apiOk = response.statusCode == 200;
    } catch (_) { apiOk = false; }

    String? suggestion;
    if (!apiOk) suggestion = "서버에 연결할 수 없습니다. 인터넷 연결 상태를 확인하세요.";

    final diagnosis = NetworkDiagnosis(
      isWifiConnected: isWifi,
      currentSsid: ssid,
      isApiReachable: apiOk,
      suggestion: suggestion,
    );

    state = AsyncData(currentState.copyWith(lastDiagnosis: diagnosis));
    return diagnosis;
  }
}
