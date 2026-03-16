// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdns_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mdnsService)
const mdnsServiceProvider = MdnsServiceProvider._();

final class MdnsServiceProvider
    extends $FunctionalProvider<MdnsService, MdnsService, MdnsService>
    with $Provider<MdnsService> {
  const MdnsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mdnsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mdnsServiceHash();

  @$internal
  @override
  $ProviderElement<MdnsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MdnsService create(Ref ref) {
    return mdnsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MdnsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MdnsService>(value),
    );
  }
}

String _$mdnsServiceHash() => r'bdce359ce3d4a48736914f8a63d80e0f2b450564';
