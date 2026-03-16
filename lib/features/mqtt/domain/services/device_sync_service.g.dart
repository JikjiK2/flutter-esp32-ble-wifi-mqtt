// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceSyncService)
const deviceSyncServiceProvider = DeviceSyncServiceProvider._();

final class DeviceSyncServiceProvider
    extends
        $FunctionalProvider<
          DeviceSyncService,
          DeviceSyncService,
          DeviceSyncService
        >
    with $Provider<DeviceSyncService> {
  const DeviceSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceSyncServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceSyncServiceHash();

  @$internal
  @override
  $ProviderElement<DeviceSyncService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceSyncService create(Ref ref) {
    return deviceSyncService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceSyncService>(value),
    );
  }
}

String _$deviceSyncServiceHash() => r'529c7efe4e4c102d546be72a02aae1123228623a';
