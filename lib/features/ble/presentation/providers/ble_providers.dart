import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/log_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_repository.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_usecase_providers.dart';

part 'ble_providers.g.dart';

@Riverpod(keepAlive: true)
BleRepository bleRepository(Ref ref) {
  throw UnimplementedError('bleRepositoryProvider must be overridden in main.dart');
}

@riverpod
Stream<BleAdapterState> bluetoothAdapterState(Ref ref) =>
    ref.watch(bleRepositoryProvider).adapterState;

@riverpod
Stream<bool> isScanning(Ref ref) => ref.watch(bleRepositoryProvider).isScanning;

@riverpod
Stream<List<BleDevice>> scanResults(Ref ref) {
  final repo = ref.watch(bleRepositoryProvider);
  final adapterState = ref.watch(bluetoothAdapterStateProvider).value;

  if (adapterState == BleAdapterState.on) {
    repo.startDeviceScan();
  }

  ref.onDispose(() => repo.stopDeviceScan());
  return repo.scanDevices();
}

@riverpod
Stream<BleDeviceConnectionState> bleDeviceState(Ref ref, String macId) =>
    ref.watch(bleRepositoryProvider).deviceStateStream(macId);


@Riverpod(keepAlive: true)
class BleDataLog extends _$BleDataLog {
  static const int _maxLogCount = 50;
  StreamSubscription? _logSubscription;

  @override
  CommunicationLog build() {
    final watchUseCase = ref.watch(watchBleLogUseCaseProvider);
    
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
    state = state.copyWith(txLogs: [msg.trim(), ...state.txLogs.take(_maxLogCount - 1)]);
  }

  void addRx(String msg) {
    state = state.copyWith(rxLogs: [msg.trim(), ...state.rxLogs.take(_maxLogCount - 1)]);
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
