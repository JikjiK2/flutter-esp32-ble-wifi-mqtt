// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_setup_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MqttSetupController)
const mqttSetupControllerProvider = MqttSetupControllerProvider._();

final class MqttSetupControllerProvider
    extends $AsyncNotifierProvider<MqttSetupController, MqttSetupState> {
  const MqttSetupControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttSetupControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttSetupControllerHash();

  @$internal
  @override
  MqttSetupController create() => MqttSetupController();
}

String _$mqttSetupControllerHash() =>
    r'85e2237f9d31f2e9c8a3796abf151203d126bc29';

abstract class _$MqttSetupController extends $AsyncNotifier<MqttSetupState> {
  FutureOr<MqttSetupState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<MqttSetupState>, MqttSetupState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MqttSetupState>, MqttSetupState>,
              AsyncValue<MqttSetupState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
