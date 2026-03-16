// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bleRepository)
const bleRepositoryProvider = BleRepositoryProvider._();

final class BleRepositoryProvider
    extends $FunctionalProvider<BleRepository, BleRepository, BleRepository>
    with $Provider<BleRepository> {
  const BleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleRepositoryHash();

  @$internal
  @override
  $ProviderElement<BleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BleRepository create(Ref ref) {
    return bleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleRepository>(value),
    );
  }
}

String _$bleRepositoryHash() => r'aeea92538e6a24894bee155d321571b0e880c9f8';

@ProviderFor(bluetoothAdapterState)
const bluetoothAdapterStateProvider = BluetoothAdapterStateProvider._();

final class BluetoothAdapterStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<BleAdapterState>,
          BleAdapterState,
          Stream<BleAdapterState>
        >
    with $FutureModifier<BleAdapterState>, $StreamProvider<BleAdapterState> {
  const BluetoothAdapterStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bluetoothAdapterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bluetoothAdapterStateHash();

  @$internal
  @override
  $StreamProviderElement<BleAdapterState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BleAdapterState> create(Ref ref) {
    return bluetoothAdapterState(ref);
  }
}

String _$bluetoothAdapterStateHash() =>
    r'37cfbdfa5e1ebc5f1a17713d02baf1051a48b653';

@ProviderFor(isScanning)
const isScanningProvider = IsScanningProvider._();

final class IsScanningProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsScanningProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isScanningProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isScanningHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isScanning(ref);
  }
}

String _$isScanningHash() => r'c4ed8f41d9bf29b30a7dc91e75a2a863cc55d0c1';

@ProviderFor(scanResults)
const scanResultsProvider = ScanResultsProvider._();

final class ScanResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BleDevice>>,
          List<BleDevice>,
          Stream<List<BleDevice>>
        >
    with $FutureModifier<List<BleDevice>>, $StreamProvider<List<BleDevice>> {
  const ScanResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanResultsHash();

  @$internal
  @override
  $StreamProviderElement<List<BleDevice>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<BleDevice>> create(Ref ref) {
    return scanResults(ref);
  }
}

String _$scanResultsHash() => r'280d472b81ae17c56f724e70df8de3255da398ab';

@ProviderFor(bleDeviceState)
const bleDeviceStateProvider = BleDeviceStateFamily._();

final class BleDeviceStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<BleDeviceConnectionState>,
          BleDeviceConnectionState,
          Stream<BleDeviceConnectionState>
        >
    with
        $FutureModifier<BleDeviceConnectionState>,
        $StreamProvider<BleDeviceConnectionState> {
  const BleDeviceStateProvider._({
    required BleDeviceStateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bleDeviceStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bleDeviceStateHash();

  @override
  String toString() {
    return r'bleDeviceStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<BleDeviceConnectionState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BleDeviceConnectionState> create(Ref ref) {
    final argument = this.argument as String;
    return bleDeviceState(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BleDeviceStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bleDeviceStateHash() => r'660284d3661892a0dc52eb524af19941127cee3d';

final class BleDeviceStateFamily extends $Family
    with $FunctionalFamilyOverride<Stream<BleDeviceConnectionState>, String> {
  const BleDeviceStateFamily._()
    : super(
        retry: null,
        name: r'bleDeviceStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BleDeviceStateProvider call(String macId) =>
      BleDeviceStateProvider._(argument: macId, from: this);

  @override
  String toString() => r'bleDeviceStateProvider';
}

@ProviderFor(BleDataLog)
const bleDataLogProvider = BleDataLogProvider._();

final class BleDataLogProvider
    extends $NotifierProvider<BleDataLog, CommunicationLog> {
  const BleDataLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleDataLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleDataLogHash();

  @$internal
  @override
  BleDataLog create() => BleDataLog();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunicationLog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunicationLog>(value),
    );
  }
}

String _$bleDataLogHash() => r'6a4985aa4c03b34ba44c8948788c6e2728632235';

abstract class _$BleDataLog extends $Notifier<CommunicationLog> {
  CommunicationLog build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CommunicationLog, CommunicationLog>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CommunicationLog, CommunicationLog>,
              CommunicationLog,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
