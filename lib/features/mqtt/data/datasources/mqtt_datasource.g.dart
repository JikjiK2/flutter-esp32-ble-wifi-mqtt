// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mqttDataSource)
const mqttDataSourceProvider = MqttDataSourceProvider._();

final class MqttDataSourceProvider
    extends $FunctionalProvider<MqttDataSource, MqttDataSource, MqttDataSource>
    with $Provider<MqttDataSource> {
  const MqttDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttDataSourceHash();

  @$internal
  @override
  $ProviderElement<MqttDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MqttDataSource create(Ref ref) {
    return mqttDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttDataSource>(value),
    );
  }
}

String _$mqttDataSourceHash() => r'a1d1934acd0b41adf0131460a3f151b41a2441a8';
