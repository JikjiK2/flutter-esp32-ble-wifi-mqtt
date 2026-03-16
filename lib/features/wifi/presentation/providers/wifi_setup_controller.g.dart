// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_setup_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WifiSetupController)
const wifiSetupControllerProvider = WifiSetupControllerProvider._();

final class WifiSetupControllerProvider
    extends $AsyncNotifierProvider<WifiSetupController, WifiSetupState> {
  const WifiSetupControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiSetupControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiSetupControllerHash();

  @$internal
  @override
  WifiSetupController create() => WifiSetupController();
}

String _$wifiSetupControllerHash() =>
    r'228c17c45f384a8904930f15d7fd3b82a0ec5844';

abstract class _$WifiSetupController extends $AsyncNotifier<WifiSetupState> {
  FutureOr<WifiSetupState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<WifiSetupState>, WifiSetupState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WifiSetupState>, WifiSetupState>,
              AsyncValue<WifiSetupState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
