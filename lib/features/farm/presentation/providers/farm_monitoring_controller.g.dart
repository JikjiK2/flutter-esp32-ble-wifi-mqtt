// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_monitoring_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FarmMonitoringController)
const farmMonitoringControllerProvider = FarmMonitoringControllerFamily._();

final class FarmMonitoringControllerProvider
    extends $NotifierProvider<FarmMonitoringController, FarmMonitoringState> {
  const FarmMonitoringControllerProvider._({
    required FarmMonitoringControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'farmMonitoringControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$farmMonitoringControllerHash();

  @override
  String toString() {
    return r'farmMonitoringControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FarmMonitoringController create() => FarmMonitoringController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FarmMonitoringState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FarmMonitoringState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FarmMonitoringControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$farmMonitoringControllerHash() =>
    r'fb87234fcf40558f9fad6fb914c78a95bc8d529c';

final class FarmMonitoringControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FarmMonitoringController,
          FarmMonitoringState,
          FarmMonitoringState,
          FarmMonitoringState,
          String
        > {
  const FarmMonitoringControllerFamily._()
    : super(
        retry: null,
        name: r'farmMonitoringControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FarmMonitoringControllerProvider call(String deviceId) =>
      FarmMonitoringControllerProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'farmMonitoringControllerProvider';
}

abstract class _$FarmMonitoringController
    extends $Notifier<FarmMonitoringState> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  FarmMonitoringState build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<FarmMonitoringState, FarmMonitoringState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FarmMonitoringState, FarmMonitoringState>,
              FarmMonitoringState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
