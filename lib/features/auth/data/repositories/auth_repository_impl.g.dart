// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthRepositoryImpl)
const authRepositoryImplProvider = AuthRepositoryImplProvider._();

final class AuthRepositoryImplProvider
    extends $AsyncNotifierProvider<AuthRepositoryImpl, UserInfo?> {
  const AuthRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryImplHash();

  @$internal
  @override
  AuthRepositoryImpl create() => AuthRepositoryImpl();
}

String _$authRepositoryImplHash() =>
    r'e5466576359f78ff2a545a50035b23441f1e4441';

abstract class _$AuthRepositoryImpl extends $AsyncNotifier<UserInfo?> {
  FutureOr<UserInfo?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserInfo?>, UserInfo?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserInfo?>, UserInfo?>,
              AsyncValue<UserInfo?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
