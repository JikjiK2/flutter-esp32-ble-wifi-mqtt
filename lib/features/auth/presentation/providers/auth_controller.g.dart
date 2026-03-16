// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, UserInfo?> {
  const AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'c4c519393eb0c83114a75273bee44228017f3ed9';

abstract class _$AuthController extends $AsyncNotifier<UserInfo?> {
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
