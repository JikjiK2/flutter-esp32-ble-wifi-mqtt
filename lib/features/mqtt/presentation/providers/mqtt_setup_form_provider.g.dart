// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_setup_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MqttSetupForm)
const mqttSetupFormProvider = MqttSetupFormProvider._();

final class MqttSetupFormProvider
    extends $NotifierProvider<MqttSetupForm, MqttSetupFormData> {
  const MqttSetupFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttSetupFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttSetupFormHash();

  @$internal
  @override
  MqttSetupForm create() => MqttSetupForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttSetupFormData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttSetupFormData>(value),
    );
  }
}

String _$mqttSetupFormHash() => r'817ebc7f2bc4b955caad5d95c90478bfcbd31692';

abstract class _$MqttSetupForm extends $Notifier<MqttSetupFormData> {
  MqttSetupFormData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MqttSetupFormData, MqttSetupFormData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MqttSetupFormData, MqttSetupFormData>,
              MqttSetupFormData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
