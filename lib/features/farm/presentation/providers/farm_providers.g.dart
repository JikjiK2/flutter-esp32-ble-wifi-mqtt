// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(farmRepository)
const farmRepositoryProvider = FarmRepositoryProvider._();

final class FarmRepositoryProvider
    extends $FunctionalProvider<FarmRepository, FarmRepository, FarmRepository>
    with $Provider<FarmRepository> {
  const FarmRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'farmRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$farmRepositoryHash();

  @$internal
  @override
  $ProviderElement<FarmRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FarmRepository create(Ref ref) {
    return farmRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FarmRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FarmRepository>(value),
    );
  }
}

String _$farmRepositoryHash() => r'a24c69430c6bd2788b68783acd0dd35ef4886eed';

@ProviderFor(fcmRegistration)
const fcmRegistrationProvider = FcmRegistrationProvider._();

final class FcmRegistrationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const FcmRegistrationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmRegistrationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmRegistrationHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return fcmRegistration(ref);
  }
}

String _$fcmRegistrationHash() => r'18be58cd4f41eda89587ecb4aea4e22867764cb1';

@ProviderFor(sampledSensorStream)
const sampledSensorStreamProvider = SampledSensorStreamFamily._();

final class SampledSensorStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<SensorHistory?>,
          SensorHistory?,
          Stream<SensorHistory?>
        >
    with $FutureModifier<SensorHistory?>, $StreamProvider<SensorHistory?> {
  const SampledSensorStreamProvider._({
    required SampledSensorStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sampledSensorStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sampledSensorStreamHash();

  @override
  String toString() {
    return r'sampledSensorStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<SensorHistory?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<SensorHistory?> create(Ref ref) {
    final argument = this.argument as String;
    return sampledSensorStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SampledSensorStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sampledSensorStreamHash() =>
    r'f158d20ad2662b1892d0a280d1d41df8e7c6adf4';

final class SampledSensorStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<SensorHistory?>, String> {
  const SampledSensorStreamFamily._()
    : super(
        retry: null,
        name: r'sampledSensorStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SampledSensorStreamProvider call(String deviceId) =>
      SampledSensorStreamProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'sampledSensorStreamProvider';
}
