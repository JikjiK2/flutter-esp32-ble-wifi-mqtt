import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/usecases/farm_usecases.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_providers.dart';

part 'farm_usecase_providers.g.dart';

@riverpod
GetMyDevicesUseCase getMyDevicesUseCase(Ref ref) =>
    GetMyDevicesUseCase(ref.watch(farmRepositoryProvider));

@riverpod
GetLatestStatusUseCase getLatestStatusUseCase(Ref ref) =>
    GetLatestStatusUseCase(ref.watch(farmRepositoryProvider));

@riverpod
RegisterFarmDeviceUseCase registerDeviceUseCase(Ref ref) =>
    RegisterFarmDeviceUseCase(ref.watch(farmRepositoryProvider));

@riverpod
UpdateFarmDeviceUseCase updateFarmDeviceUseCase(Ref ref) =>
    UpdateFarmDeviceUseCase(ref.watch(farmRepositoryProvider));

@riverpod
DeleteFarmDeviceUseCase deleteFarmDeviceUseCase(Ref ref) =>
    DeleteFarmDeviceUseCase(ref.watch(farmRepositoryProvider));

@riverpod
GetSensorHistoryUseCase getSensorHistoryUseCase(Ref ref) =>
    GetSensorHistoryUseCase(ref.watch(farmRepositoryProvider));

@riverpod
GetRulesUseCase getRulesUseCase(Ref ref) =>
    GetRulesUseCase(ref.watch(farmRepositoryProvider));

@riverpod
CreateRuleUseCase createRuleUseCase(Ref ref) =>
    CreateRuleUseCase(ref.watch(farmRepositoryProvider));

@riverpod
UpdateRuleUseCase updateRuleUseCase(Ref ref) =>
    UpdateRuleUseCase(ref.watch(farmRepositoryProvider));

@riverpod
DeleteRuleUseCase deleteRuleUseCase(Ref ref) =>
    DeleteRuleUseCase(ref.watch(farmRepositoryProvider));
