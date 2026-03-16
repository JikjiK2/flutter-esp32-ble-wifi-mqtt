// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerConfig)
const serverConfigProvider = ServerConfigProvider._();

final class ServerConfigProvider
    extends $AsyncNotifierProvider<ServerConfig, ServerConfigState> {
  const ServerConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverConfigHash();

  @$internal
  @override
  ServerConfig create() => ServerConfig();
}

String _$serverConfigHash() => r'69edbc76163fd7605012f57e119a8c58daa610b4';

abstract class _$ServerConfig extends $AsyncNotifier<ServerConfigState> {
  FutureOr<ServerConfigState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ServerConfigState>, ServerConfigState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ServerConfigState>, ServerConfigState>,
              AsyncValue<ServerConfigState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
