// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mqttRepository)
const mqttRepositoryProvider = MqttRepositoryProvider._();

final class MqttRepositoryProvider
    extends $FunctionalProvider<MqttRepository, MqttRepository, MqttRepository>
    with $Provider<MqttRepository> {
  const MqttRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttRepositoryHash();

  @$internal
  @override
  $ProviderElement<MqttRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MqttRepository create(Ref ref) {
    return mqttRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttRepository>(value),
    );
  }
}

String _$mqttRepositoryHash() => r'd2f90517978fc5ab0d84c9ef938cc7df12db91ae';

@ProviderFor(SavedMqttInfo)
const savedMqttInfoProvider = SavedMqttInfoProvider._();

final class SavedMqttInfoProvider
    extends $AsyncNotifierProvider<SavedMqttInfo, SavedMqttInfoData> {
  const SavedMqttInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedMqttInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedMqttInfoHash();

  @$internal
  @override
  SavedMqttInfo create() => SavedMqttInfo();
}

String _$savedMqttInfoHash() => r'63a7381e80143c4ebe9330d7a52571142ffe5dd4';

abstract class _$SavedMqttInfo extends $AsyncNotifier<SavedMqttInfoData> {
  FutureOr<SavedMqttInfoData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SavedMqttInfoData>, SavedMqttInfoData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SavedMqttInfoData>, SavedMqttInfoData>,
              AsyncValue<SavedMqttInfoData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MqttDataLog)
const mqttDataLogProvider = MqttDataLogProvider._();

final class MqttDataLogProvider
    extends $NotifierProvider<MqttDataLog, CommunicationLog> {
  const MqttDataLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttDataLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttDataLogHash();

  @$internal
  @override
  MqttDataLog create() => MqttDataLog();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunicationLog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunicationLog>(value),
    );
  }
}

String _$mqttDataLogHash() => r'1e1e32c873ea95a5b96e7576903659552990a14a';

abstract class _$MqttDataLog extends $Notifier<CommunicationLog> {
  CommunicationLog build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CommunicationLog, CommunicationLog>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CommunicationLog, CommunicationLog>,
              CommunicationLog,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
