import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    final authStateAsync = ref.watch(authStateProvider);
    final user = authStateAsync.value;
    final colorScheme = Theme.of(context).colorScheme;

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
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => context.push('/settings'),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.wb_incandescent_rounded,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '환영합니다. ${user?.email ?? '사용자'}님',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '스마트팜 기기를 연결하고 실시간으로 관리해보세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 48),
                _buildFeatureCard(
                  context,
                  title: '대시보드',
                  subtitle: '등록된 기기의 실시간 상태 확인 및 제어',
                  icon: Icons.dashboard_rounded,
                  color: colorScheme.primary,
                  onTap: () => context.push('/farm_dashboard'),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  title: '블루투스 연결',
                  subtitle: '주변 ESP32 기기 스캔',
                  icon: Icons.bluetooth_searching_rounded,
                  color: Colors.blue,
                  onTap: () => context.push('/ble_device_list'),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  title: 'WiFi 직접 제어',
                  subtitle: 'AP 모드 기기에 접속하여 설정 및 테스트',
                  icon: Icons.wifi_rounded,
                  color: Colors.red,
                  onTap: () => context.push('/wifi_home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colorScheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}
