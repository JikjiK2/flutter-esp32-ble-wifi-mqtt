// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_usecase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginUseCase)
const loginUseCaseProvider = LoginUseCaseProvider._();

final class LoginUseCaseProvider
    extends $FunctionalProvider<LoginUseCase, LoginUseCase, LoginUseCase>
    with $Provider<LoginUseCase> {
  const LoginUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoginUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUseCase create(Ref ref) {
    return loginUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUseCase>(value),
    );
  }
}

String _$loginUseCaseHash() => r'5a95b111ff086652f0c947b88bcfe26ea7ce95be';

@ProviderFor(googleLoginUseCase)
const googleLoginUseCaseProvider = GoogleLoginUseCaseProvider._();

final class GoogleLoginUseCaseProvider
    extends
        $FunctionalProvider<
          GoogleLoginUseCase,
          GoogleLoginUseCase,
          GoogleLoginUseCase
        >
    with $Provider<GoogleLoginUseCase> {
  const GoogleLoginUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleLoginUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleLoginUseCaseHash();

  @$internal
  @override
  $ProviderElement<GoogleLoginUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleLoginUseCase create(Ref ref) {
    return googleLoginUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleLoginUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleLoginUseCase>(value),
    );
  }
}

String _$googleLoginUseCaseHash() =>
    r'b4324912d5a53f4eb99c577d3a30ba91cb344624';

@ProviderFor(logoutUseCase)
const logoutUseCaseProvider = LogoutUseCaseProvider._();

final class LogoutUseCaseProvider
    extends $FunctionalProvider<LogoutUseCase, LogoutUseCase, LogoutUseCase>
    with $Provider<LogoutUseCase> {
  const LogoutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUseCaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUseCase create(Ref ref) {
    return logoutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUseCase>(value),
    );
  }
}

String _$logoutUseCaseHash() => r'c3c6c589cbff5a2f6618cc56b1f9faae632da27a';

@ProviderFor(getAuthStateUseCase)
const getAuthStateUseCaseProvider = GetAuthStateUseCaseProvider._();

final class GetAuthStateUseCaseProvider
    extends
        $FunctionalProvider<
          GetAuthStateUseCase,
          GetAuthStateUseCase,
          GetAuthStateUseCase
        >
    with $Provider<GetAuthStateUseCase> {
  const GetAuthStateUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAuthStateUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAuthStateUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAuthStateUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAuthStateUseCase create(Ref ref) {
    return getAuthStateUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAuthStateUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAuthStateUseCase>(value),
    );
  }
}

String _$getAuthStateUseCaseHash() =>
    r'88c9b5592cd40de5e078d15b811073000c2c6e2b';
