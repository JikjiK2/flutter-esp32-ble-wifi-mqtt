import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (!next.isLoading) {}
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(scale: value, child: child),
                );
              },
              child: const Icon(
                Icons.wb_incandescent_rounded,
                size: 100,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Smart Farm Connect',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 48),
            if (authState.isLoading)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
