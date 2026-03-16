import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_providers.dart';

class WifiHomeScreen extends ConsumerWidget {
  const WifiHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedInfoAsync = ref.watch(savedDeviceInfoProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'WiFi 제어 센터',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: savedInfoAsync.when(
        data: (info) => _buildContent(context, ref, info),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('정보를 불러오지 못했습니다: $e')),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    SavedDeviceInfoData info,
  ) {
    final bool hasDevice = info.ssid != null;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDeviceStatusCard(colorScheme, hasDevice, info),
          const SizedBox(height: 40),
          _buildSectionHeader(colorScheme, "설정 및 연결"),
          const SizedBox(height: 16),
          _buildMenuCard(
            context,
            title: '새로운 기기 설정',
            subtitle: '기기를 WiFi 네트워크에 연결합니다.',
            icon: Icons.wifi_find_rounded,
            color: colorScheme.primary,
            onPressed: () => context.push('/wifi_setup'),
          ),
          const SizedBox(height: 16),
          _buildMenuCard(
            context,
            title: '로컬 네트워크 제어',
            subtitle: hasDevice ? '현재 연결된 기기를 즉시 제어합니다.' : '먼저 기기 설정을 완료해주세요.',
            icon: Icons.settings_remote_rounded,
            color: hasDevice ? Colors.teal : colorScheme.outline,
            onPressed: hasDevice ? () => context.push('/wifi_control') : null,
          ),
          if (hasDevice) ...[
            const SizedBox(height: 48),
            _buildDangerZone(context, ref, info),
          ],
        ],
      ),
    );
  }

  Widget _buildDeviceStatusCard(
    ColorScheme colorScheme,
    bool hasDevice,
    SavedDeviceInfoData info,
  ) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: hasDevice
              ? [
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.8),
                ]
              : [
                  colorScheme.surfaceContainerHighest,
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: (hasDevice ? colorScheme.primary : colorScheme.outline)
                .withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            hasDevice ? '${info.deviceId}' : '등록된 기기 없음',
            style: TextStyle(
              color: hasDevice
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          if (hasDevice)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '연결된 네트워크: ${info.ssid}',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ColorScheme colorScheme, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    final bool isEnabled = onPressed != null;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: isEnabled
          ? colorScheme.surfaceContainerLow
          : colorScheme.surface.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(
            alpha: isEnabled ? 0.5 : 0.2,
          ),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isEnabled
                      ? color.withValues(alpha: 0.1)
                      : colorScheme.outlineVariant.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: isEnabled ? color : colorScheme.outline,
                  size: 24,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isEnabled
                            ? colorScheme.onSurface
                            : colorScheme.outline,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDangerZone(
    BuildContext context,
    WidgetRef ref,
    SavedDeviceInfoData info,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _confirmClear(context, ref, info),
              icon: const Icon(Icons.delete_sweep_rounded, size: 18),
              label: const Text(
                '기기 정보 초기화 실행',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.error,
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
          const SizedBox(height: 20),
          const Text(
            '기기 초기화 시 저장된 WiFi 정보가 삭제되며 재설정이 필요합니다.',
            style: TextStyle(fontSize: 12, color: Colors.blueGrey, height: 1.4),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClear(
    BuildContext context,
    WidgetRef ref,
    SavedDeviceInfoData info,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: const Text('정말 초기화할까요?'),
        content: const Text('이 작업은 되돌릴 수 없습니다.\n기기를 공장 초기화 상태로 되돌립니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              '초기화',
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (result == true && context.mounted) {
      if (info.deviceIp != null && info.deviceIp!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('기기에 초기화 명령을 전송 중입니다...'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        final resetResult = await ref
            .read(wifiRepositoryProvider)
            .resetDevice(info.deviceIp!);

        if (resetResult is Failure && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('기기 응답 없음: 앱 내부 정보만 삭제합니다.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }

      await ref.read(savedDeviceInfoProvider.notifier).clear();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('초기화가 완료되었습니다.'),
            backgroundColor: colorScheme.secondary,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
