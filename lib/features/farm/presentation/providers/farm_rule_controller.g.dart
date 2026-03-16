// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_rule_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FarmRuleController)
const farmRuleControllerProvider = FarmRuleControllerFamily._();

final class FarmRuleControllerProvider
    extends $AsyncNotifierProvider<FarmRuleController, List<RuleEntity>> {
  const FarmRuleControllerProvider._({
    required FarmRuleControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'farmRuleControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$farmRuleControllerHash();

  @override
  String toString() {
    return r'farmRuleControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FarmRuleController create() => FarmRuleController();

  @override
  bool operator ==(Object other) {
    return other is FarmRuleControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$farmRuleControllerHash() =>
    r'978a4fa8ce073553d05e5bf1f1dea0f4db279ac1';

final class FarmRuleControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FarmRuleController,
          AsyncValue<List<RuleEntity>>,
          List<RuleEntity>,
          FutureOr<List<RuleEntity>>,
          String
        > {
  const FarmRuleControllerFamily._()
    : super(
        retry: null,
        name: r'farmRuleControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FarmRuleControllerProvider call(String deviceId) =>
      FarmRuleControllerProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'farmRuleControllerProvider';
}

abstract class _$FarmRuleController extends $AsyncNotifier<List<RuleEntity>> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  FutureOr<List<RuleEntity>> build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<RuleEntity>>, List<RuleEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RuleEntity>>, List<RuleEntity>>,
              AsyncValue<List<RuleEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
