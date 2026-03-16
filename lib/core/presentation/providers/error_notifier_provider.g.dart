// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ErrorNotifier)
const errorProvider = ErrorNotifierProvider._();

final class ErrorNotifierProvider
    extends $NotifierProvider<ErrorNotifier, String?> {
  const ErrorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorNotifierHash();

  @$internal
  @override
  ErrorNotifier create() => ErrorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$errorNotifierHash() => r'43dce7f9aa7d1b6515d3b3523378029bbdee524a';

abstract class _$ErrorNotifier extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
