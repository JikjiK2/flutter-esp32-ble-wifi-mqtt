// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authenticatedDio)
const authenticatedDioProvider = AuthenticatedDioProvider._();

final class AuthenticatedDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const AuthenticatedDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticatedDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticatedDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return authenticatedDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$authenticatedDioHash() => r'c1ab7c53ca7aec562b304c512902916daa547a10';
