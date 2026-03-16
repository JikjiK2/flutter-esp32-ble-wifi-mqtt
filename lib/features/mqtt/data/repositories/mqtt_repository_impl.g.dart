// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mqttRepositoryImpl)
const mqttRepositoryImplProvider = MqttRepositoryImplProvider._();

final class MqttRepositoryImplProvider
    extends $FunctionalProvider<MqttRepository, MqttRepository, MqttRepository>
    with $Provider<MqttRepository> {
  const MqttRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<MqttRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MqttRepository create(Ref ref) {
    return mqttRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttRepository>(value),
    );
  }
}

String _$mqttRepositoryImplHash() =>
    r'e79b9561a09b8550d890e69b5d0d23d448f1df7b';
