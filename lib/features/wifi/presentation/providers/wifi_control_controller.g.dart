// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_control_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WifiControlController)
const wifiControlControllerProvider = WifiControlControllerProvider._();

final class WifiControlControllerProvider
    extends $NotifierProvider<WifiControlController, WifiControlState> {
  const WifiControlControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiControlControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiControlControllerHash();

  @$internal
  @override
  WifiControlController create() => WifiControlController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiControlState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiControlState>(value),
    );
  }
}

String _$wifiControlControllerHash() =>
    r'6a6742c30de245c56f0eb215aa5412d31fe63e51';

abstract class _$WifiControlController extends $Notifier<WifiControlState> {
  WifiControlState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WifiControlState, WifiControlState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WifiControlState, WifiControlState>,
              WifiControlState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
