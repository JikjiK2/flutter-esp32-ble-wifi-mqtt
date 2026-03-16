// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_control_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleControlController)
const bleControlControllerProvider = BleControlControllerFamily._();

final class BleControlControllerProvider
    extends $NotifierProvider<BleControlController, BleControlState> {
  const BleControlControllerProvider._({
    required BleControlControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bleControlControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bleControlControllerHash();

  @override
  String toString() {
    return r'bleControlControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BleControlController create() => BleControlController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleControlState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleControlState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BleControlControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bleControlControllerHash() =>
    r'929630c0c5e7aa5e9da3d4b3a6013289eadebcf5';

final class BleControlControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          BleControlController,
          BleControlState,
          BleControlState,
          BleControlState,
          String
        > {
  const BleControlControllerFamily._()
    : super(
        retry: null,
        name: r'bleControlControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BleControlControllerProvider call(String macId) =>
      BleControlControllerProvider._(argument: macId, from: this);

  @override
  String toString() => r'bleControlControllerProvider';
}

abstract class _$BleControlController extends $Notifier<BleControlState> {
  late final _$args = ref.$arg as String;
  String get macId => _$args;

  BleControlState build(String macId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<BleControlState, BleControlState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BleControlState, BleControlState>,
              BleControlState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BleConnection)
const bleConnectionProvider = BleConnectionProvider._();

final class BleConnectionProvider
    extends $AsyncNotifierProvider<BleConnection, String?> {
  const BleConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleConnectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleConnectionHash();

  @$internal
  @override
  BleConnection create() => BleConnection();
}

String _$bleConnectionHash() => r'4af8a5f1136c9e261f053e63e290e7acf938c3bf';

abstract class _$BleConnection extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
