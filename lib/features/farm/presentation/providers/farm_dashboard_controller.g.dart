// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FarmDashboard)
const farmDashboardProvider = FarmDashboardProvider._();

final class FarmDashboardProvider
    extends $AsyncNotifierProvider<FarmDashboard, List<DeviceDashboardState>> {
  const FarmDashboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'farmDashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$farmDashboardHash();

  @$internal
  @override
  FarmDashboard create() => FarmDashboard();
}

String _$farmDashboardHash() => r'141c41dbae5231148208b75a8d5b678982866b00';

abstract class _$FarmDashboard
    extends $AsyncNotifier<List<DeviceDashboardState>> {
  FutureOr<List<DeviceDashboardState>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DeviceDashboardState>>,
              List<DeviceDashboardState>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DeviceDashboardState>>,
                List<DeviceDashboardState>
              >,
              AsyncValue<List<DeviceDashboardState>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
