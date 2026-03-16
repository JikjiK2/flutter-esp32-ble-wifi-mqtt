import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_config_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/entities/wifi_network_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/domain/repositories/wifi_repository.dart';

class DiscoverWifiDeviceUseCase {
  final WifiRepository repository;

  DiscoverWifiDeviceUseCase(this.repository);

  Future<Result<String>> execute(String deviceId) =>
      repository.discoverDevice(deviceId);
}

class GetWifiDevicesUseCase {
  final WifiRepository repository;

  GetWifiDevicesUseCase(this.repository);

  Future<Result<List<WifiNetwork>>> execute() => repository.scanNearbyDevices();
}

class WifiConnectToDeviceUseCase {
  final WifiRepository repository;

  WifiConnectToDeviceUseCase(this.repository);

  Future<Result<bool>> execute(String ssid) {
    if (ssid.isEmpty) {
      return Future.value(
        Result.failure(const AppException.business("SSID가 비어있습니다.")),
      );
    }
    return repository.connectToDevice(ssid);
  }
}

class WifiDisconnectFromDeviceUseCase {
  final WifiRepository repository;

  WifiDisconnectFromDeviceUseCase(this.repository);

  Future<void> execute() => repository.disconnectFromDevice();
}

class WifiSetForceUsageUseCase {
  final WifiRepository repository;

  WifiSetForceUsageUseCase(this.repository);

  Future<void> execute(bool use) => repository.setForceWifiUsage(use);
}

class GetWifiNetworksUseCase {
  final WifiRepository repository;

  GetWifiNetworksUseCase(this.repository);

  Future<Result<List<WifiNetwork>>> execute() =>
      repository.getAvailableNetworks();
}

class SendWifiCredentialsUseCase {
  final WifiRepository repository;

  SendWifiCredentialsUseCase(this.repository);

  Future<Result<void>> execute(WifiConfig config) async {
    if (config.ssid.isEmpty) {
      return Result.failure(const AppException.business("공유기를 선택해 주세요."));
    }
    if (config.password.isNotEmpty && config.password.length < 8) {
      return Result.failure(
        const AppException.business("비밀번호는 최소 8자 이상이어야 합니다."),
      );
    }
    return await repository.sendWifiCredentials(config);
  }
}

class SendWifiCommandUseCase {
  final WifiRepository repository;

  SendWifiCommandUseCase(this.repository);

  Future<Result<void>> execute(LampStatus status) =>
      repository.sendCommand(status);
}

class ResetWifiDeviceUseCase {
  final WifiRepository repository;

  ResetWifiDeviceUseCase(this.repository);

  Future<Result<void>> execute(String host) => repository.resetDevice(host);
}

class CheckWifiStatusUseCase {
  final WifiRepository repository;

  CheckWifiStatusUseCase(this.repository);

  Future<Result<String?>> execute() => repository.checkWifiStatus();
}

class ConnectWifiControlUseCase {
  final WifiRepository repository;

  ConnectWifiControlUseCase(this.repository);

  Future<Result<void>> execute(String host) => repository.connectControl(host);
}

class DisconnectWifiControlUseCase {
  final WifiRepository repository;

  DisconnectWifiControlUseCase(this.repository);

  Future<Result<void>> execute() => repository.disconnectControl();
}

class WatchWifiStatusUseCase {
  final WifiRepository repository;

  WatchWifiStatusUseCase(this.repository);

  Stream<LampStatus> execute() => repository.statusStream;
}

class WatchWifiLogUseCase {
  final WifiRepository repository;

  WatchWifiLogUseCase(this.repository);

  Stream<String> execute() => repository.rawLogStream;
}
