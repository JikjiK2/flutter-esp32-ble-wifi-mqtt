// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bleDataSource)
const bleDataSourceProvider = BleDataSourceProvider._();

final class BleDataSourceProvider
    extends $FunctionalProvider<BleDataSource, BleDataSource, BleDataSource>
    with $Provider<BleDataSource> {
  const BleDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleDataSourceHash();

  @$internal
  @override
  $ProviderElement<BleDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BleDataSource create(Ref ref) {
    return bleDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleDataSource>(value),
    );
  }
}

String _$bleDataSourceHash() => r'd4f46caf9de247d375f50ff9760bc73080293938';
