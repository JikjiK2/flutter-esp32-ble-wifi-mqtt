// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiRepositoryImpl)
const wifiRepositoryImplProvider = WifiRepositoryImplProvider._();

final class WifiRepositoryImplProvider
    extends $FunctionalProvider<WifiRepository, WifiRepository, WifiRepository>
    with $Provider<WifiRepository> {
  const WifiRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<WifiRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WifiRepository create(Ref ref) {
    return wifiRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiRepository>(value),
    );
  }
}

String _$wifiRepositoryImplHash() =>
    r'd56f8a6b59de50c82bf4a5a38fadbd77d9a2b718';
