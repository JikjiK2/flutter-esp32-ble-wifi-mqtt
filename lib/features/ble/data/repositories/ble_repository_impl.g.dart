// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bleRepositoryImpl)
const bleRepositoryImplProvider = BleRepositoryImplProvider._();

final class BleRepositoryImplProvider
    extends $FunctionalProvider<BleRepository, BleRepository, BleRepository>
    with $Provider<BleRepository> {
  const BleRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<BleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BleRepository create(Ref ref) {
    return bleRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleRepository>(value),
    );
  }
}

String _$bleRepositoryImplHash() => r'2f474ac21ef8a1fa822f8fb46a4479b686ff5b9b';
