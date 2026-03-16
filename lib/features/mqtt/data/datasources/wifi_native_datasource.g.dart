// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_native_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiNativeDataSource)
const wifiNativeDataSourceProvider = WifiNativeDataSourceProvider._();

final class WifiNativeDataSourceProvider
    extends
        $FunctionalProvider<
          WifiNativeDataSource,
          WifiNativeDataSource,
          WifiNativeDataSource
        >
    with $Provider<WifiNativeDataSource> {
  const WifiNativeDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiNativeDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiNativeDataSourceHash();

  @$internal
  @override
  $ProviderElement<WifiNativeDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WifiNativeDataSource create(Ref ref) {
    return wifiNativeDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiNativeDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiNativeDataSource>(value),
    );
  }
}

String _$wifiNativeDataSourceHash() =>
    r'e78fb444770315be8ee0a1aaee934cedb71e368b';
