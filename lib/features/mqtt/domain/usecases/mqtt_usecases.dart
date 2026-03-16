import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_topics.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/repositories/mqtt_repository.dart';

class MqttDeviceDiscoveryUseCase {
  final MqttRepository repository;
  MqttDeviceDiscoveryUseCase(this.repository);
  Future<Result<List<MqttSetupNetwork>>> execute() => repository.scanNearbyDevices();
}

class MqttConnectToDeviceUseCase {
  final MqttRepository repository;
  MqttConnectToDeviceUseCase(this.repository);
  Future<Result<bool>> execute(String ssid) async {
    if (ssid.isEmpty) return Result.failure(const AppException.business('SSID가 비어있습니다.'));
    return repository.connectToDevice(ssid);
  }
}

class MqttDisconnectFromDeviceUseCase {
  final MqttRepository repository;
  MqttDisconnectFromDeviceUseCase(this.repository);
  Future<void> execute() => repository.disconnectFromDevice();
}

class MqttSetForceWifiUseCase {
  final MqttRepository repository;
  MqttSetForceWifiUseCase(this.repository);
  Future<void> execute(bool use) => repository.setForceWifiUsage(use);
}

class CheckMqttWifiStatusUseCase {
  final MqttRepository repository;
  CheckMqttWifiStatusUseCase(this.repository);
  Future<Result<String?>> execute() => repository.checkWifiStatus();
}

class MqttSendConfigUseCase {
  final MqttRepository repository;
  MqttSendConfigUseCase(this.repository);

  Future<Result<void>> execute({
    required String deviceId,
    required String ssid,
    required String password,
    required String brokerIp,
    required String ownerEmail,
  }) async {
    if (ssid.isEmpty) return Result.failure(const AppException.business('WiFi SSID를 입력해주세요.'));
    if (brokerIp.isEmpty) return Result.failure(const AppException.business('MQTT 브로커 주소를 입력해주세요.'));
    if (ownerEmail.isEmpty || !ownerEmail.contains('@')) {
      return Result.failure(const AppException.business('올바른 소유자 이메일이 필요합니다.'));
    }

    return repository.sendMqttConfig(
      ssid: ssid,
      password: password,
      brokerIp: brokerIp,
      deviceId: deviceId,
      ownerEmail: ownerEmail,
    );
  }
}

class WifiReconfigureRemoteUseCase {
  final MqttRepository repository;
  WifiReconfigureRemoteUseCase(this.repository);

  Future<Result<void>> execute({
    required String deviceId,
    String? ssid,
    String? password,
  }) async {
    final Map<String, dynamic> config = {
      'command': 'reconfigure',
      if (ssid != null) 'ssid': ssid,
      if (password != null) 'password': password,
    };
    return repository.reconfigureDevice(deviceId: deviceId, config: config);
  }
}

class RemoteWifiScanUseCase {
  final MqttRepository repository;
  RemoteWifiScanUseCase(this.repository);

  Future<Result<void>> execute(String deviceId) {
    final String topic = MqttTopics.deviceControl(deviceId);
    const String payload = '{"command": "scan_wifi"}';
    return repository.publishRaw(topic, payload);
  }
}

class MqttPublishRawUseCase {
  final MqttRepository repository;
  MqttPublishRawUseCase(this.repository);

  Future<Result<void>> execute(String deviceId, String jsonPayload) {
    final topic = MqttTopics.deviceControl(deviceId);
    return repository.publishRaw(topic, jsonPayload);
  }
}

class MqttFinalizeSetupUseCase {
  final MqttRepository repository;
  MqttFinalizeSetupUseCase(this.repository);
  Future<Result<void>> execute() => repository.finalizeSetup();
}

class ConnectMqttUseCase {
  final MqttRepository repository;
  ConnectMqttUseCase(this.repository);
  
  Future<Result<void>> execute(String host, int port, {String? username, String? password}) {
    if (host.isEmpty) return Future.value(Result.failure(const AppException.business('호스트 주소가 없습니다.')));
    return repository.connect(host, port, username: username, password: password);
  }
}

class DisconnectMqttUseCase {
  final MqttRepository repository;
  DisconnectMqttUseCase(this.repository);
  Future<Result<void>> execute() => repository.disconnect();
}

class SendMqttCommandUseCase {
  final MqttRepository repository;
  SendMqttCommandUseCase(this.repository);
  Future<Result<void>> execute(String deviceId, LampStatus status) => repository.sendCommand(deviceId, status);
}

class ResetMqttDeviceUseCase {
  final MqttRepository repository;
  ResetMqttDeviceUseCase(this.repository);
  Future<Result<void>> execute(String deviceId) => repository.resetDevice(deviceId);
}

class GetMqttAvailableNetworksUseCase {
  final MqttRepository repository;
  GetMqttAvailableNetworksUseCase(this.repository);
  Future<Result<List<MqttSetupNetwork>>> execute() => repository.getAvailableNetworks();
}

class CheckMqttConnectionStatusUseCase {
  final MqttRepository repository;
  CheckMqttConnectionStatusUseCase(this.repository);
  Future<Result<Map<String, dynamic>>> execute() => repository.checkMqttStatus();
}

class WatchMqttLogUseCase {
  final MqttRepository repository;
  WatchMqttLogUseCase(this.repository);
  Stream<String> execute() => repository.rawLogStream;
}
