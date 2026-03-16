import 'dart:async';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_repository.dart';

class TurnOnBluetoothUseCase {
  final BleRepository _repository;

  TurnOnBluetoothUseCase(this._repository);

  Future<Result<void>> execute() => _repository.turnOnBlueTooth();
}

class StartDeviceScanUseCase {
  final BleRepository _repository;

  StartDeviceScanUseCase(this._repository);

  Future<void> execute() => _repository.startDeviceScan();
}

class StopDeviceScanUseCase {
  final BleRepository _repository;

  StopDeviceScanUseCase(this._repository);

  Future<Result<void>> execute() => _repository.stopDeviceScan();
}

class ConnectDeviceUseCase {
  final BleRepository _repository;

  ConnectDeviceUseCase(this._repository);

  Future<Result<void>> execute(String macId) =>
      _repository.connectDevice(macId);
}

class DisconnectDeviceUseCase {
  final BleRepository _repository;

  DisconnectDeviceUseCase(this._repository);

  Future<Result<void>> execute() => _repository.disconnectDevice();
}

class SendLampStatusUseCase {
  final BleRepository _repository;

  SendLampStatusUseCase(this._repository);

  Future<Result<void>> execute(String macId, LampStatus status) =>
      _repository.sendLampStatus(macId, status);
}

class RequestBleSyncUseCase {
  final BleRepository _repository;

  RequestBleSyncUseCase(this._repository);

  Future<Result<void>> execute(String macId) async {
    return await _repository.sendLampStatus(
      macId,
      const LampStatus(deviceId: "sync"),
      description: "Requesting status sync",
    );
  }
}

class WatchBleStatusUseCase {
  final BleRepository _repository;

  WatchBleStatusUseCase(this._repository);

  Stream<LampStatus> execute(String macId) => _repository.statusStream(macId);
}

class WatchBleRssiUseCase {
  final BleRepository _repository;

  WatchBleRssiUseCase(this._repository);

  Stream<int> execute(String macId) {
    return Stream.periodic(const Duration(seconds: 2)).asyncMap((_) async {
      final result = await _repository.readRssi(macId);
      switch (result) {
        case Success<int>(data: final value):
          return value;
        case Failure():
          return -100;
      }
    });
  }
}

class WatchBleLogUseCase {
  final BleRepository repository;

  WatchBleLogUseCase(this.repository);

  Stream<String> execute() => repository.rawLogStream;
}
