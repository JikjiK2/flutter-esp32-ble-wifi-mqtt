// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_control_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MqttControlController)
const mqttControlControllerProvider = MqttControlControllerFamily._();

final class MqttControlControllerProvider
    extends $NotifierProvider<MqttControlController, MqttControlState> {
  const MqttControlControllerProvider._({
    required MqttControlControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mqttControlControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mqttControlControllerHash();

  @override
  String toString() {
    return r'mqttControlControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MqttControlController create() => MqttControlController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttControlState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttControlState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MqttControlControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mqttControlControllerHash() =>
    r'8aabbf4a31362fb4d5fda0fc5fa432119634dd81';

final class MqttControlControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          MqttControlController,
          MqttControlState,
          MqttControlState,
          MqttControlState,
          String
        > {
  const MqttControlControllerFamily._()
    : super(
        retry: null,
        name: r'mqttControlControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MqttControlControllerProvider call(String deviceId) =>
      MqttControlControllerProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'mqttControlControllerProvider';
}

abstract class _$MqttControlController extends $Notifier<MqttControlState> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  MqttControlState build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<MqttControlState, MqttControlState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MqttControlState, MqttControlState>,
              MqttControlState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
