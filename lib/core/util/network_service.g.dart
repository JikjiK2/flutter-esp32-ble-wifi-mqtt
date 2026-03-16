// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkService)
const networkServiceProvider = NetworkServiceProvider._();

final class NetworkServiceProvider
    extends $FunctionalProvider<NetworkService, NetworkService, NetworkService>
    with $Provider<NetworkService> {
  const NetworkServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkServiceHash();

  @$internal
  @override
  $ProviderElement<NetworkService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkService create(Ref ref) {
    return networkService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkService>(value),
    );
  }
}

String _$networkServiceHash() => r'abd92e8d8a32b24c4c48e3478d128f36bbaecd8c';
