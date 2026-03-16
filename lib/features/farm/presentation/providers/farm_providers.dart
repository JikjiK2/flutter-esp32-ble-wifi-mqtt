import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/core/util/fcm_helper.dart';
import 'package:flutter_esp32_ble_wifi/core/network/dio_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/sensor_history_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/repositories/farm_repository.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_providers.dart';

part 'farm_providers.g.dart';

@Riverpod(keepAlive: true)
FarmRepository farmRepository(Ref ref) {
  throw UnimplementedError(
    'farmRepositoryProvider must be overridden in main.dart',
  );
}

@Riverpod(keepAlive: true)
Future<void> fcmRegistration(Ref ref) async {
  final user = ref.watch(authStateProvider).value;
  if (user != null) {
    try {
      final dio = ref.read(authenticatedDioProvider);
      await FcmHelper.registerTokenToServer(dio);
    } catch (_) {}
  }
}

@riverpod
Stream<SensorHistory?> sampledSensorStream(Ref ref, String deviceId) async* {
  final stream = ref.watch(mqttRepositoryProvider).multiDeviceStatusStream;

  await for (final statusMap in stream) {
    final status = statusMap[deviceId];
    if (status == null || (status.temperature == 0 && status.humidity == 0)) {
      yield null;
      continue;
    }

    yield SensorHistory(
      timestamp: DateTime.now(),
      temperature: status.temperature,
      humidity: status.humidity,
    );
  }
}
