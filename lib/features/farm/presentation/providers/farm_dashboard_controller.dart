import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/util/fcm_helper.dart';
import 'package:flutter_esp32_ble_wifi/core/network/dio_provider.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/server_config_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_usecase_providers.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_status_providers.dart';

part 'farm_dashboard_controller.g.dart';

enum DeviceOnlineStatus { connecting, online, offline, error, actionRequired }

class DeviceDashboardState {
  final DeviceEntity device;
  final LampStatus? latestStatus;
  final DeviceOnlineStatus onlineStatus;
  final DateTime? lastUpdated;

  DeviceDashboardState({
    required this.device,
    this.latestStatus,
    this.onlineStatus = DeviceOnlineStatus.connecting,
    this.lastUpdated,
  });

  DeviceDashboardState copyWith({
    DeviceEntity? device,
    LampStatus? latestStatus,
    DeviceOnlineStatus? onlineStatus,
    DateTime? lastUpdated,
  }) {
    return DeviceDashboardState(
      device: device ?? this.device,
      latestStatus: latestStatus ?? this.latestStatus,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

@riverpod
class FarmDashboard extends _$FarmDashboard {
  Timer? _offlineCheckTimer;
  static bool _isFcmRegistered = false;

  @override
  FutureOr<List<DeviceDashboardState>> build() async {
    ref.watch(serverConfigProvider);

    ref.onDispose(() {
      _offlineCheckTimer?.cancel();
    });

    final getMyDevices = ref.watch(getMyDevicesUseCaseProvider);
    final getLatestStatus = ref.watch(getLatestStatusUseCaseProvider);

    final connStatus =
        ref.watch(mqttConnectionStatusProvider('all')).value ??
        ConnectionStatus.disconnected;

    final devicesResult = await getMyDevices.execute();

    return switch (devicesResult) {
      Success(data: final devices) => () async {
        final List<DeviceDashboardState> initialState = await Future.wait(
          devices.map((device) async {
            final latestResult = await getLatestStatus.execute(device.deviceId);

            DeviceOnlineStatus status = DeviceOnlineStatus.connecting;
            if (connStatus == ConnectionStatus.error) {
              status = DeviceOnlineStatus.error;
            } else if (connStatus == ConnectionStatus.disconnected) {
              status = DeviceOnlineStatus.offline;
            }

            return DeviceDashboardState(
              device: device,
              latestStatus: latestResult is Success<LampStatus?>
                  ? latestResult.data
                  : null,
              lastUpdated: (latestResult is Success<LampStatus?>)
                  ? latestResult.data?.timestamp
                  : null,
              onlineStatus: status,
            );
          }),
        );

        ref.listen(mqttMultiDeviceStatusProvider, (prev, next) {
          next.whenData((statusMap) => _updateWithMqttData(statusMap));
        });

        _startOfflineCheckTimer();

        if (!_isFcmRegistered) {
          _registerFcmToken();
        }

        return initialState;
      }(),
      Failure(exception: final e) => throw e,
    };
  }

  void _updateState(
    List<DeviceDashboardState> Function(List<DeviceDashboardState>) update,
  ) {
    state = state.whenData(update);
  }

  void _startOfflineCheckTimer() {
    _offlineCheckTimer?.cancel();
    _offlineCheckTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _checkHealth(),
    );
  }

  void _checkHealth() {
    if (!ref.mounted) return;

    _updateState((currentList) {
      final now = DateTime.now();
      return currentList.map((item) {
        if (item.onlineStatus == DeviceOnlineStatus.online &&
            item.lastUpdated != null) {
          if (now.difference(item.lastUpdated!).inMinutes >= 2) {
            return item.copyWith(onlineStatus: DeviceOnlineStatus.offline);
          }
        }
        return item;
      }).toList();
    });
  }

  void _updateWithMqttData(Map<String, LampStatus> statusMap) {
    if (!ref.mounted) return;

    _updateState((currentList) {
      return currentList.map((item) {
        final targetId = item.device.deviceId.trim().toLowerCase();
        final matchingKey = statusMap.keys.firstWhere(
          (key) => key.trim().toLowerCase() == targetId,
          orElse: () => '',
        );

        if (matchingKey.isNotEmpty) {
          return item.copyWith(
            latestStatus: statusMap[matchingKey],
            onlineStatus: DeviceOnlineStatus.online,
            lastUpdated: DateTime.now(),
          );
        }
        return item;
      }).toList();
    });
  }

  Future<Result<void>> renameDevice(String deviceId, String newName) async {
    final result = await ref
        .read(updateFarmDeviceUseCaseProvider)
        .execute(deviceId, newName);
    if (result is Success) {
      ref.invalidateSelf();
    }
    return result;
  }

  Future<Result<void>> removeDevice(String deviceId) async {
    final result = await ref
        .read(deleteFarmDeviceUseCaseProvider)
        .execute(deviceId);
    if (result is Success) {
      ref.invalidateSelf();
    }
    return result;
  }

  Future<void> _registerFcmToken() async {
    if (ref.read(authStateProvider).value != null) {
      try {
        final dio = ref.read(authenticatedDioProvider);
        await FcmHelper.registerTokenToServer(dio);
        _isFcmRegistered = true;
      } catch (_) {}
    }
  }
}
