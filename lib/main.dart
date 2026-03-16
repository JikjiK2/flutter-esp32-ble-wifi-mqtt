import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/firebase_options.dart';
import 'package:flutter_esp32_ble_wifi/core/router/router.dart';
import 'package:flutter_esp32_ble_wifi/core/util/fcm_helper.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/app_exception.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/theme_provider.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/global_error_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/data/repositories/mqtt_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/data/repositories/wifi_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/repositories/ble_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/data/repositories/farm_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_providers.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmHelper.initialize();

  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          (ref) => ref.watch(authRepositoryImplProvider.notifier),
        ),
        mqttRepositoryProvider.overrideWith(
          (ref) => ref.watch(mqttRepositoryImplProvider),
        ),
        farmRepositoryProvider.overrideWith(
          (ref) => ref.watch(farmRepositoryImplProvider),
        ),
        wifiRepositoryProvider.overrideWith(
          (ref) => ref.watch(wifiRepositoryImplProvider),
        ),
        bleRepositoryProvider.overrideWith(
          (ref) => ref.watch(bleRepositoryImplProvider),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    ref.listen<AppException?>(globalErrorProvider, (previous, next) {
      if (next == null) return;

      if (next is UnauthorizedException) {
        _showSessionExpiredDialog();
      } else {
        _showErrorSnackBar(next.readableMessage);
      }
      ref.read(globalErrorProvider.notifier).clear();
    });

    return MaterialApp.router(
      title: 'Smart Farm Connect',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }

  void _showSessionExpiredDialog() {
    final context = scaffoldMessengerKey.currentContext;
    if (context == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 8),
            Text('로그인 만료'),
          ],
        ),
        content: const Text('인증 정보가 올바르지 않거나 만료되었습니다.\n안전을 위해 다시 로그인해 주세요.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
