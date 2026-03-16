// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_status_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mqttMultiDeviceStatus)
const mqttMultiDeviceStatusProvider = MqttMultiDeviceStatusProvider._();

final class MqttMultiDeviceStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, LampStatus>>,
          Map<String, LampStatus>,
          Stream<Map<String, LampStatus>>
        >
    with
        $FutureModifier<Map<String, LampStatus>>,
        $StreamProvider<Map<String, LampStatus>> {
  const MqttMultiDeviceStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttMultiDeviceStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttMultiDeviceStatusHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, LampStatus>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, LampStatus>> create(Ref ref) {
    return mqttMultiDeviceStatus(ref);
  }
}

String _$mqttMultiDeviceStatusHash() =>
    r'e431d89ff78e0627ce7cfc9b234ec1eadbdf8869';

@ProviderFor(mqttLampStatus)
const mqttLampStatusProvider = MqttLampStatusFamily._();

final class MqttLampStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<LampStatus>,
          LampStatus,
          Stream<LampStatus>
        >
    with $FutureModifier<LampStatus>, $StreamProvider<LampStatus> {
  const MqttLampStatusProvider._({
    required MqttLampStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mqttLampStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mqttLampStatusHash();

  @override
  String toString() {
    return r'mqttLampStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<LampStatus> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<LampStatus> create(Ref ref) {
    final argument = this.argument as String;
    return mqttLampStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MqttLampStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mqttLampStatusHash() => r'1fede4aaf8c1f92f730ee0861e5e212f19f9120b';

final class MqttLampStatusFamily extends $Family
    with $FunctionalFamilyOverride<Stream<LampStatus>, String> {
  const MqttLampStatusFamily._()
    : super(
        retry: null,
        name: r'mqttLampStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MqttLampStatusProvider call(String deviceId) =>
      MqttLampStatusProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'mqttLampStatusProvider';
}

@ProviderFor(mqttConnectionStatus)
const mqttConnectionStatusProvider = MqttConnectionStatusFamily._();

final class MqttConnectionStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<ConnectionStatus>,
          ConnectionStatus,
          Stream<ConnectionStatus>
        >
    with $FutureModifier<ConnectionStatus>, $StreamProvider<ConnectionStatus> {
  const MqttConnectionStatusProvider._({
    required MqttConnectionStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mqttConnectionStatusProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mqttConnectionStatusHash();

  @override
  String toString() {
    return r'mqttConnectionStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ConnectionStatus> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ConnectionStatus> create(Ref ref) {
    final argument = this.argument as String;
    return mqttConnectionStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MqttConnectionStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mqttConnectionStatusHash() =>
    r'5b111ceba74ee40cb905322c1f3399cc777908e4';

final class MqttConnectionStatusFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ConnectionStatus>, String> {
  const MqttConnectionStatusFamily._()
    : super(
        retry: null,
        name: r'mqttConnectionStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MqttConnectionStatusProvider call(String deviceId) =>
      MqttConnectionStatusProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'mqttConnectionStatusProvider';
}

@ProviderFor(mqttRemoteWifiScanResults)
const mqttRemoteWifiScanResultsProvider = MqttRemoteWifiScanResultsProvider._();

final class MqttRemoteWifiScanResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MqttSetupNetwork>>,
          List<MqttSetupNetwork>,
          Stream<List<MqttSetupNetwork>>
        >
    with
        $FutureModifier<List<MqttSetupNetwork>>,
        $StreamProvider<List<MqttSetupNetwork>> {
  const MqttRemoteWifiScanResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttRemoteWifiScanResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttRemoteWifiScanResultsHash();

  @$internal
  @override
  $StreamProviderElement<List<MqttSetupNetwork>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<MqttSetupNetwork>> create(Ref ref) {
    return mqttRemoteWifiScanResults(ref);
  }
}

String _$mqttRemoteWifiScanResultsHash() =>
    r'970ed1f1d11f337fe5d21391f4f461edb2ebd795';
