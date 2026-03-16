// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiDataSourceImpl)
const wifiDataSourceImplProvider = WifiDataSourceImplProvider._();

final class WifiDataSourceImplProvider
    extends $FunctionalProvider<WifiDataSource, WifiDataSource, WifiDataSource>
    with $Provider<WifiDataSource> {
  const WifiDataSourceImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiDataSourceImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiDataSourceImplHash();

  @$internal
  @override
  $ProviderElement<WifiDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WifiDataSource create(Ref ref) {
    return wifiDataSourceImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiDataSource>(value),
    );
  }
}

String _$wifiDataSourceImplHash() =>
    r'8814e951a6413f2244dda174b0fe3e0954c7e2f3';
