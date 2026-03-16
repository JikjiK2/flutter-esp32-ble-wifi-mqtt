// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_error_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GlobalError)
const globalErrorProvider = GlobalErrorProvider._();

final class GlobalErrorProvider
    extends $NotifierProvider<GlobalError, AppException?> {
  const GlobalErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalErrorHash();

  @$internal
  @override
  GlobalError create() => GlobalError();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppException? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppException?>(value),
    );
  }
}

String _$globalErrorHash() => r'1625394f59022364d621a294e86a633ff0ddf9e4';

abstract class _$GlobalError extends $Notifier<AppException?> {
  AppException? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppException?, AppException?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppException?, AppException?>,
              AppException?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
