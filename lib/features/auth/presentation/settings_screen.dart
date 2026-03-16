import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/theme_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/auth/presentation/providers/auth_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authControllerProvider);
    final user = authStateAsync.value;
    final themeMode = ref.watch(themeProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('설정', style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              if (user != null)
                _buildSection(
                  context,
                  title: '계정 정보',
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person_rounded,
                          color: colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        user.email,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '인증된 사용자',
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 16),
              _buildSection(
                context,
                title: '디스플레이 설정',
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '테마 모드',
                          style: TextStyle(
                            fontSize: 14,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: SegmentedButton<ThemeMode>(
                            segments: const [
                              ButtonSegment(
                                value: ThemeMode.system,
                                label: Text('시스템'),
                                icon: Icon(Icons.brightness_auto_rounded),
                              ),
                              ButtonSegment(
                                value: ThemeMode.light,
                                label: Text('라이트'),
                                icon: Icon(Icons.light_mode_rounded),
                              ),
                              ButtonSegment(
                                value: ThemeMode.dark,
                                label: Text('다크'),
                                icon: Icon(Icons.dark_mode_rounded),
                              ),
                            ],
                            selected: {themeMode},
                            onSelectionChanged: (Set<ThemeMode> newSelection) {
                              ref
                                  .read(themeProvider.notifier)
                                  .setThemeMode(newSelection.first);
                            },
                            style: SegmentedButton.styleFrom(
                              selectedBackgroundColor:
                                  colorScheme.primaryContainer,
                              selectedForegroundColor: colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              _buildSection(
                context,
                title: '앱 정보',
                children: [
                  ListTile(
                    leading: Icon(Icons.copyright, color: colorScheme.outline),
                    title: const Text('오픈소스 라이선스'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      showLicensePage(
                        context: context,
                        applicationName: 'Flutter IoT Demo App',
                        applicationVersion: '1.0.0',
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: OutlinedButton.icon(
                  onPressed: authStateAsync.isLoading
                      ? null
                      : () => _showLogoutDialog(context, ref),
                  icon: Icon(
                    Icons.logout_rounded,
                    color: colorScheme.error,
                    size: 18,
                  ),
                  label: Text(
                    '로그아웃',
                    style: TextStyle(
                      color: colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: colorScheme.error.withValues(alpha: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),

          if (authStateAsync.isLoading) _buildLoadingOverlay(colorScheme),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        ...children,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Divider(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingOverlay(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.scrim.withValues(alpha: 0.6),
      child: Center(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 24),
                Text(
                  "로그아웃 중",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "안전하게 세션을 종료하고 있습니다.",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('로그아웃'),
        content: const Text('정말 로그아웃 하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              '로그아웃',
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    if (result == true) {
      await ref.read(authControllerProvider.notifier).logout();
      if (context.mounted) {
        context.go('/login');
      }
    }
  }
}
