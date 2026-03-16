// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gpsService)
const gpsServiceProvider = GpsServiceProvider._();

final class GpsServiceProvider
    extends $FunctionalProvider<GpsService, GpsService, GpsService>
    with $Provider<GpsService> {
  const GpsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gpsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gpsServiceHash();

  @$internal
  @override
  $ProviderElement<GpsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GpsService create(Ref ref) {
    return gpsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GpsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GpsService>(value),
    );
  }
}

String _$gpsServiceHash() => r'cb10c4029c3b84c33606dba6813821ab9d6d2202';
