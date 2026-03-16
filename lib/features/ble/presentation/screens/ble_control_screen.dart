import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/common_log_viewer.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_status_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_color_picker_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_control_settings_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/device_control/device_power_button.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_control_controller.dart';

class BleControlScreen extends ConsumerStatefulWidget {
  final String macId;
  final String deviceName;

  const BleControlScreen({
    super.key,
    required this.macId,
    required this.deviceName,
  });

  @override
  ConsumerState<BleControlScreen> createState() => _BleControlScreenState();
}

class _BleControlScreenState extends ConsumerState<BleControlScreen> {
  bool _isExitingManually = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bleControlControllerProvider(widget.macId).notifier).requestSync(widget.macId);
    });
  }

  Future<void> _handleExit() async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('연결 종료'),
        content: const Text('블루투스 기기와의 연결을 끊고 나가시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('계속 제어')),
          TextButton(
            onPressed: () => Navigator.pop(context, true), 
            child: Text('연결 해제', style: TextStyle(color: colorScheme.error, fontWeight: FontWeight.bold))
          ),
        ],
      ),
    );
    
    if (result == true && mounted) {
      setState(() => _isExitingManually = true);
      await ref.read(bleConnectionProvider.notifier).disconnect();
      if (mounted) context.pop();
    }
  }

  Future<void> _showPowerConfirmDialog(bool currentStatus, VoidCallback onConfirm) async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(currentStatus ? 'LED 전원 끄기' : 'LED 전원 켜기'),
        content: Text(currentStatus ? 'LED 전원을 끄시겠습니까?' : 'LED 전원을 켜시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('취소')),
          TextButton(
            onPressed: () => Navigator.pop(context, true), 
            child: Text(currentStatus ? '끄기' : '켜기', style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold))
          ),
        ],
      ),
    );
    if (result == true) onConfirm();
  }

  @override
  Widget build(BuildContext context) {
    final controlState = ref.watch(bleControlControllerProvider(widget.macId));
    final controller = ref.read(bleControlControllerProvider(widget.macId).notifier);
    final localStatus = controlState.localStatus;
    final logState = ref.watch(bleDataLogProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(bleDeviceStateProvider(widget.macId), (previous, next) {
      if (!_isExitingManually && next.value == BleDeviceConnectionState.disconnected) {
        if (context.mounted) {
          _showDisconnectDialog(colorScheme);
        }
      }
    });

    if (localStatus.timestamp == null) {
      return _buildLoadingScreen(colorScheme, textTheme, controller);
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.deviceName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
            tooltip: '상태 동기화',
            onPressed: () => controller.requestSync(widget.macId),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.requestSync(widget.macId),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            children: [
              DevicePowerButton(
                isOn: localStatus.isOn,
                activeColor: colorScheme.primary,
                statusText: localStatus.isOn ? 'LED 전원이 켜져 있습니다' : 'LED 전원이 꺼져 있습니다',
                onTap: () => _showPowerConfirmDialog(localStatus.isOn, () {
                  controller.updateStatus(widget.macId, isOn: !localStatus.isOn);
                }),
              ),
              const SizedBox(height: 40),
              
              DeviceStatusCard(status: localStatus, isBle: true),
              const SizedBox(height: 16),
              CommonLogViewer(
                logState: logState,
                title: '실시간 데이터 (BLE)',
                onToggleExpanded: () => ref.read(bleDataLogProvider.notifier).toggleExpanded(),
              ),
              const SizedBox(height: 16),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: localStatus.isOn ? 1.0 : 0.4,
                child: IgnorePointer(
                  ignoring: !localStatus.isOn,
                  child: Column(
                    children: [
                      DeviceControlSettingsCard(
                        status: localStatus,
                        onBrightnessChanged: (val) => controller.updateStatus(widget.macId, brightness: val),
                        onBrightModeChanged: (val) => controller.updateStatus(widget.macId, brightMode: val),
                      ),
                      const SizedBox(height: 16),
                      DeviceColorPickerCard(
                        status: localStatus,
                        onColorChanged: (val) => controller.updateStatus(widget.macId, color: val),
                        onModeChanged: (val) => controller.updateStatus(widget.macId, ledMode: val),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildExitButton(colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen(ColorScheme colorScheme, TextTheme textTheme, BleControlController controller) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text(widget.deviceName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 32),
            Text('${widget.deviceName}에서 데이터를 수신 중입니다...', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 48),
            TextButton.icon(
              onPressed: () => controller.requestSync(widget.macId),
              icon: const Icon(Icons.sync_rounded),
              label: const Text('수동 동기화 시도'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExitButton(ColorScheme colorScheme) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.error,
        side: BorderSide(color: colorScheme.error.withValues(alpha: 0.5)),
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: _handleExit,
      icon: const Icon(Icons.bluetooth_disabled_rounded, size: 18),
      label: const Text('제어 종료 및 블루투스 해제', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  void _showDisconnectDialog(ColorScheme colorScheme) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            Icon(Icons.bluetooth_disabled_rounded, color: colorScheme.error),
            const SizedBox(width: 12),
            const Text('연결 끊김'),
          ],
        ),
        content: const Text('기기와의 블루투스 연결이 해제되었습니다.\n초기 화면으로 돌아갑니다.'),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              if (mounted) context.pop();
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
