import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/common_log_viewer.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_status_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_power_button.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_color_picker_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_control_settings_card.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_control_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_dashboard_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_monitoring_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_usecase_providers.dart';

class FarmMonitoringScreen extends ConsumerStatefulWidget {
  final String deviceId;

  const FarmMonitoringScreen({super.key, required this.deviceId});

  @override
  ConsumerState<FarmMonitoringScreen> createState() =>
      _FarmMonitoringScreenState();
}

class _FarmMonitoringScreenState extends ConsumerState<FarmMonitoringScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(farmMonitoringControllerProvider(widget.deviceId).notifier)
          .fetchHistory();
    });
  }

  void _showDeviceMenu(String deviceName) {
    final colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                '기기 관리 ($deviceName)',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: Icon(
                Icons.settings_input_component_rounded,
                color: colorScheme.primary,
              ),
              title: const Text('WiFi 재설정'),
              onTap: () {
                Navigator.pop(context);
                context.push('/mqtt_reconfig/${widget.deviceId}');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.rule_folder_rounded,
                color: colorScheme.tertiary,
              ),
              title: const Text('자동화 규칙 설정'),
              onTap: () {
                Navigator.pop(context);
                context.push('/rules/${widget.deviceId}');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever_rounded,
                color: colorScheme.error,
              ),
              title: const Text('기기 삭제 및 초기화'),
              onTap: () {
                Navigator.pop(context);
                _handleDeleteDevice();
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _handleDeleteDevice() async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('기기 완전 삭제'),
        content: const Text(
          '기기를 앱에서 삭제하고 모든 설정을 초기화하시겠습니까?\n이 작업은 취소할 수 없으며, 기기는 다시 설정 모드로 돌아갑니다.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              '삭제 실행',
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      try {
        await ref.read(mqttRepositoryProvider).resetDevice(widget.deviceId);
      } catch (_) {}
      final result = await ref
          .read(deleteFarmDeviceUseCaseProvider)
          .execute(widget.deviceId);
      if (mounted && result is Success) {
        ref.invalidate(farmDashboardProvider);
        context.go('/farm_dashboard');
      }
    }
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
    final farmState = ref.watch(
      farmMonitoringControllerProvider(widget.deviceId),
    );
    final mqttState = ref.watch(mqttControlControllerProvider(widget.deviceId));
    final logState = ref.watch(mqttDataLogProvider);
    final colorScheme = Theme.of(context).colorScheme;

    final dashboardAsync = ref.watch(farmDashboardProvider);
    final deviceData = dashboardAsync.maybeWhen(
      data: (devices) => devices.firstWhere(
        (d) => d.device.deviceId == widget.deviceId,
        orElse: () => DeviceDashboardState(
          device: DeviceEntity(deviceId: widget.deviceId, name: '연결 중...'),
        ),
      ),
      orElse: () => DeviceDashboardState(
        device: DeviceEntity(deviceId: widget.deviceId, name: '로딩 중...'),
      ),
    );

    final realTimeStatus = mqttState.localStatus;
    final controller = ref.read(
      mqttControlControllerProvider(widget.deviceId).notifier,
    );

    if (realTimeStatus.timestamp == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(title: Text(deviceData.device.name)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: colorScheme.primary),
              const SizedBox(height: 24),
              const Text(
                '실시간 데이터를 불러오고 있습니다...',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deviceData.device.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.deviceId,
              style: TextStyle(
                fontSize: 11,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () => _showDeviceMenu(deviceData.device.name),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref
            .read(farmMonitoringControllerProvider(widget.deviceId).notifier)
            .fetchHistory(period: farmState.selectedPeriod),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DevicePowerButton(
                isOn: realTimeStatus.isOn,
                activeColor: colorScheme.primary,
                statusText: realTimeStatus.isOn
                    ? 'LED 전원이 켜져 있습니다'
                    : 'LED 전원이 꺼져 있습니다',
                onTap: () => _showPowerConfirmDialog(realTimeStatus.isOn, () {
                  controller.togglePower(!realTimeStatus.isOn);
                }),
              ),
              const SizedBox(height: 40),

              DeviceStatusCard(status: realTimeStatus, isBle: false),
              const SizedBox(height: 16),
              CommonLogViewer(
                logState: logState,
                title: '실시간 데이터 (MQTT)',
                onToggleExpanded: () =>
                    ref.read(mqttDataLogProvider.notifier).toggleExpanded(),
              ),
              const SizedBox(height: 24),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: realTimeStatus.isOn ? 1.0 : 0.3,
                child: IgnorePointer(
                  ignoring: !realTimeStatus.isOn,
                  child: Column(
                    children: [
                      DeviceControlSettingsCard(
                        status: realTimeStatus,
                        onBrightnessChanged: (val) =>
                            controller.updateStatus(brightness: val),
                        onBrightModeChanged: (val) =>
                            controller.updateStatus(brightMode: val),
                      ),
                      const SizedBox(height: 16),
                      DeviceColorPickerCard(
                        status: realTimeStatus,
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
        ),
      ),
    );
  }
}
