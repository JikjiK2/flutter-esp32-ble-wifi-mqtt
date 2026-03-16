import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/log_entity.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/common_log_viewer.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_status_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_power_button.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_control_settings_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_color_picker_card.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/wifi/presentation/providers/wifi_control_controller.dart';


class WifiControlScreen extends ConsumerStatefulWidget {
  const WifiControlScreen({super.key});

  @override
  ConsumerState<WifiControlScreen> createState() => _WifiControlScreenState();
}

class _WifiControlScreenState extends ConsumerState<WifiControlScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wifiControlControllerProvider.notifier).autoConnect();
    });
  }

  void _handleExit() {
    ref.read(wifiControlControllerProvider.notifier).disconnect();
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _showPowerConfirmDialog(
    bool currentStatus,
    VoidCallback onConfirm,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(currentStatus ? 'LED 전원 끄기' : 'LED 전원 켜기'),
        content: Text(currentStatus ? 'LED 전원을 끄시겠습니까?' : 'LED 전원을 켜시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              currentStatus ? '끄기' : '켜기',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    if (result == true) onConfirm();
  }

  @override
  Widget build(BuildContext context) {
    final wifiState = ref.watch(wifiControlControllerProvider);
    final controller = ref.read(wifiControlControllerProvider.notifier);
    final logState = ref.watch(wifiDataLogProvider);
    final savedInfo = ref.watch(savedDeviceInfoProvider).value;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final status = wifiState.localStatus;

    if (wifiState.isInitialLoading || wifiState.isDiscovering) {
      return _buildDiscoveryScreen(colorScheme, textTheme);
    }

    if (wifiState.connectionStatus == ConnectionStatus.error ||
        (wifiState.connectionStatus == ConnectionStatus.disconnected &&
            wifiState.currentIp == null)) {
      return _buildErrorScreen(colorScheme, textTheme, controller);
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              savedInfo?.deviceId ?? 'WiFi 제어',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (savedInfo?.ssid != null)
              Text(
                'Network: ${savedInfo!.ssid}',
                style: TextStyle(
                  fontSize: 11,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
              ),
          ],
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: _handleExit,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync_rounded),
            tooltip: '재연결 시도',
            onPressed: () => controller.autoConnect(),
          ),
        ],
      ),
      body: _buildBody(context, status, controller, logState),
    );
  }

  Widget _buildBody(
    BuildContext context,
    LampStatus status,
    WifiControlController controller,
    CommunicationLog logState,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isOn = status.isOn;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        children: [
          DevicePowerButton(
            isOn: isOn,
            activeColor: colorScheme.primary,
            statusText: isOn ? 'LED 전원이 켜져 있습니다' : 'LED 전원이 꺼져 있습니다',
            onTap: () => _showPowerConfirmDialog(isOn, () {
              controller.updateStatus(isOn: !isOn);
            }),
          ),
          const SizedBox(height: 40),
          DeviceStatusCard(status: status, isBle: false),
          const SizedBox(height: 16),
          CommonLogViewer(
            logState: logState,
            title: '실시간 데이터 (WiFi)',
            onToggleExpanded: () =>
                ref.read(wifiDataLogProvider.notifier).toggleExpanded(),
          ),
          const SizedBox(height: 16),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isOn ? 1.0 : 0.4,
            child: IgnorePointer(
              ignoring: !isOn,
              child: Column(
                children: [
                  DeviceControlSettingsCard(
                    status: status,
                    onBrightnessChanged: (val) =>
                        controller.updateStatus(brightness: val),
                    onBrightModeChanged: (val) =>
                        controller.updateStatus(brightMode: val),
                  ),
                  const SizedBox(height: 16),
                  DeviceColorPickerCard(
                    status: status,
                    onColorChanged: (val) =>
                        controller.updateStatus(color: val),
                    onModeChanged: (val) =>
                        controller.updateStatus(ledMode: val),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildDiscoveryScreen(ColorScheme colorScheme, TextTheme textTheme) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: const Text('기기 탐색 중')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 32),
            Text(
              '로컬 네트워크에서 기기를 찾는 중...',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 64),
            TextButton.icon(
              onPressed: _handleExit,
              icon: const Icon(Icons.close_rounded),
              label: const Text('탐색 취소'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen(
    ColorScheme colorScheme,
    TextTheme textTheme,
    WifiControlController controller,
  ) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: const Text('연결 오류')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 80,
              color: colorScheme.error.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 32),
            const Text(
              '기기를 찾을 수 없습니다',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () => controller.autoConnect(),
              child: const Text('다시 시도'),
            ),
            TextButton(onPressed: _handleExit, child: const Text('뒤로 가기')),
          ],
        ),
      ),
    );
  }
}
