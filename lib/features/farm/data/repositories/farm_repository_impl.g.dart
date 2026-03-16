// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(farmRemoteDataSource)
const farmRemoteDataSourceProvider = FarmRemoteDataSourceProvider._();

final class FarmRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          FarmRemoteDataSource,
          FarmRemoteDataSource,
          FarmRemoteDataSource
        >
    with $Provider<FarmRemoteDataSource> {
  const FarmRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'farmRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$farmRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<FarmRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FarmRemoteDataSource create(Ref ref) {
    return farmRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FarmRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FarmRemoteDataSource>(value),
    );
  }
}

String _$farmRemoteDataSourceHash() =>
    r'9c06456f329e15a3628e6dc3f1003a273d81ac4b';

@ProviderFor(farmRepositoryImpl)
const farmRepositoryImplProvider = FarmRepositoryImplProvider._();

final class FarmRepositoryImplProvider
    extends $FunctionalProvider<FarmRepository, FarmRepository, FarmRepository>
    with $Provider<FarmRepository> {
  const FarmRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'farmRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$farmRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<FarmRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FarmRepository create(Ref ref) {
    return farmRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FarmRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FarmRepository>(value),
    );
  }
}

String _$farmRepositoryImplHash() =>
    r'9dac1e749d4782aad74b2b02d25cdd5e73570357';
