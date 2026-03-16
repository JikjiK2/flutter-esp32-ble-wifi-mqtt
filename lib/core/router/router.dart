import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/home_screen.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/auth_screens.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/splash_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/settings_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/screens/ble_device_list_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/screens/ble_control_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/screens/farm_monitoring_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/screens/farm_dashboard_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/screens/rule_management_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/screens/rule_form_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/screens/wifi_home_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/screens/wifi_setup_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/screens/wifi_control_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/screens/mqtt_setup_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/screens/wifi_reconfig_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      if (authState.isLoading) return null;

      final bool isAuthenticated = authState.value != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegistering = state.matchedLocation == '/register';
      final isSplash = state.matchedLocation == '/splash';

      AppLogger.d(
        'Auth: $isAuthenticated | Location: ${state.matchedLocation}',
        tag: 'ROUTER',
      );

      if (isSplash) {
        return isAuthenticated ? '/' : '/login';
      }

      if (!isAuthenticated) {
        return (isLoggingIn || isRegistering) ? null : '/login';
      }

      if (isAuthenticated && (isLoggingIn || isRegistering)) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: 'wifi_home',
            builder: (context, state) => const WifiHomeScreen(),
          ),
          GoRoute(
            path: 'wifi_setup',
            builder: (context, state) => const WifiSetupScreen(),
          ),
          GoRoute(
            path: 'wifi_control',
            builder: (context, state) => const WifiControlScreen(),
          ),
          GoRoute(
            path: 'mqtt_setup',
            builder: (context, state) => const MqttSetupScreen(),
          ),

          GoRoute(
            path: 'ble_device_list',
            builder: (context, state) => const BleDeviceListScreen(),
          ),
          GoRoute(
            path: 'ble_control/:macId',
            builder: (context, state) {
              final macId = state.pathParameters['macId']!;
              final deviceName =
                  state.uri.queryParameters['name'] ?? 'Unknown Device';
              return BleControlScreen(macId: macId, deviceName: deviceName);
            },
          ),

          GoRoute(
            path: 'farm_dashboard',
            builder: (context, state) => const FarmDashboardScreen(),
            routes: [
              GoRoute(
                path: ':deviceId',
                builder: (context, state) {
                  final deviceId = state.pathParameters['deviceId'] ?? 'esp32';
                  return FarmMonitoringScreen(deviceId: deviceId);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'wifi_reconfig/:deviceId',
            builder: (context, state) {
              final deviceId = state.pathParameters['deviceId']!;
              return WifiReconfigScreen(deviceId: deviceId);
            },
          ),
          GoRoute(
            path: 'rules/:deviceId',
            builder: (context, state) {
              final deviceId = state.pathParameters['deviceId']!;
              return RuleManagementScreen(deviceId: deviceId);
            },
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) {
                  final deviceId = state.pathParameters['deviceId']!;
                  return RuleFormScreen(deviceId: deviceId);
                },
              ),
              GoRoute(
                path: 'edit',
                builder: (context, state) {
                  final deviceId = state.pathParameters['deviceId']!;
                  final rule = state.extra as RuleEntity;
                  return RuleFormScreen(deviceId: deviceId, rule: rule);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
