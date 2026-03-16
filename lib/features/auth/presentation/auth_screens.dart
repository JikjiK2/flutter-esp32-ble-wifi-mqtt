import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/google_login_button.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) context.go('/');
        },
      );
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final now = DateTime.now();

        if (_lastPressedAt != null &&
            now.difference(_lastPressedAt!) < const Duration(seconds: 2)) {
          await SystemNavigator.pop();
          return;
        }

        _lastPressedAt = now;
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                '한 번 더 누르면 앱이 종료됩니다.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.05),
                    colorScheme.surface,
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.wb_incandescent_rounded,
                          size: 80,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Flutter IoT Demo App',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.0,
                        ),
                      ),
                      const Text(
                        'BLE WiFi MQTT',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 80),

                      Opacity(
                        opacity: authState.isLoading ? 0.5 : 1.0,
                        child: AbsorbPointer(
                          absorbing: authState.isLoading,
                          child: GoogleLoginButton(
                            theme: isDarkMode
                                ? GoogleButtonTheme.dark
                                : GoogleButtonTheme.light,
                            shape: GoogleButtonShape.rectangular,
                            locale: GoogleButtonLocale.ko,
                            action: GoogleButtonAction.signIn,
                            scale: 1.2,
                            onPressed: () => ref
                                .read(authControllerProvider.notifier)
                                .googleLogin(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 48),
                      Text(
                        '로그인 시 이용약관 및 개인정보 처리방침에 동의하게 됩니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            if (authState.isLoading)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.primary,
                  ),
                  minHeight: 3,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
