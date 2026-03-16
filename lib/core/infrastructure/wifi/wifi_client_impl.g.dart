// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_client_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiClient)
const wifiClientProvider = WifiClientProvider._();

final class WifiClientProvider
    extends $FunctionalProvider<WifiClient, WifiClient, WifiClient>
    with $Provider<WifiClient> {
  const WifiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiClientHash();

  @$internal
  @override
  $ProviderElement<WifiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WifiClient create(Ref ref) {
    return wifiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiClient>(value),
    );
  }
}

String _$wifiClientHash() => r'38ecb85b34f81765998bc4179488b1bba9be548a';
