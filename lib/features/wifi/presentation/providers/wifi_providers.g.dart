// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiRepository)
const wifiRepositoryProvider = WifiRepositoryProvider._();

final class WifiRepositoryProvider
    extends $FunctionalProvider<WifiRepository, WifiRepository, WifiRepository>
    with $Provider<WifiRepository> {
  const WifiRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiRepositoryHash();

  @$internal
  @override
  $ProviderElement<WifiRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WifiRepository create(Ref ref) {
    return wifiRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiRepository>(value),
    );
  }
}

String _$wifiRepositoryHash() => r'73e19a60c8220063bcc4d54b3ccb6ffc0a3b8c03';

@ProviderFor(SavedDeviceInfo)
const savedDeviceInfoProvider = SavedDeviceInfoProvider._();

final class SavedDeviceInfoProvider
    extends $AsyncNotifierProvider<SavedDeviceInfo, SavedDeviceInfoData> {
  const SavedDeviceInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedDeviceInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedDeviceInfoHash();

  @$internal
  @override
  SavedDeviceInfo create() => SavedDeviceInfo();
}

String _$savedDeviceInfoHash() => r'4e22af69a44fe39dea3afb6de64b9cf75b3e6521';

abstract class _$SavedDeviceInfo extends $AsyncNotifier<SavedDeviceInfoData> {
  FutureOr<SavedDeviceInfoData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SavedDeviceInfoData>, SavedDeviceInfoData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SavedDeviceInfoData>, SavedDeviceInfoData>,
              AsyncValue<SavedDeviceInfoData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(WifiDataLog)
const wifiDataLogProvider = WifiDataLogProvider._();

final class WifiDataLogProvider
    extends $NotifierProvider<WifiDataLog, CommunicationLog> {
  const WifiDataLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiDataLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiDataLogHash();

  @$internal
  @override
  WifiDataLog create() => WifiDataLog();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunicationLog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunicationLog>(value),
    );
  }
}

String _$wifiDataLogHash() => r'5992ccd71a3711d30c83d2d2b9ac750c6ba84fdf';

abstract class _$WifiDataLog extends $Notifier<CommunicationLog> {
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
