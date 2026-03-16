import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/app_device_card.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/providers/server_config_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_status_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_control_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_dashboard_controller.dart';

class FarmDashboardScreen extends ConsumerStatefulWidget {
  const FarmDashboardScreen({super.key});

  @override
  ConsumerState<FarmDashboardScreen> createState() =>
      _FarmDashboardScreenState();
}

class _FarmDashboardScreenState extends ConsumerState<FarmDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryAutoConnect();
    });
  }

  Future<void> _tryAutoConnect() async {
    final serverConfig = ref.read(serverConfigProvider).value;
    final currentStatus = ref.read(mqttConnectionStatusProvider('all')).value;

    if (serverConfig != null &&
        currentStatus != ConnectionStatus.connected &&
        currentStatus != ConnectionStatus.connecting) {
      ref.read(mqttControlControllerProvider('global').notifier).connect();
    }
  }

  Future<void> _showPowerConfirmDialog(
    String deviceName,
    bool currentStatus,
    VoidCallback onConfirm,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(currentStatus ? 'LED 전원 끄기' : 'LED 전원 켜기'),
        content: Text(
          '"$deviceName"의 LED 전원을 ${currentStatus ? '끄시겠습니까?' : '켜시겠습니까?'}',
        ),
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
    final dashboardAsync = ref.watch(farmDashboardProvider);
    final mqttConnStatus =
        ref.watch(mqttConnectionStatusProvider('all')).value ??
        ConnectionStatus.disconnected;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Smart Farm Cloud',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              _tryAutoConnect();
              ref.invalidate(farmDashboardProvider);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildConnectionStatusBar(mqttConnStatus),
          Expanded(
            child: dashboardAsync.when(
              data: (devices) {
                if (devices.isEmpty) return _buildEmptyState();
                return _buildDeviceList(devices, false);
              },
              loading: () => Skeletonizer(
                enabled: true,
                child: _buildDeviceList(_makeMockDevices(), true),
              ),
              error: (e, st) => Center(child: Text("데이터 로드 실패: $e")),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/mqtt_setup'),
        label: const Text(
          '새 기기 등록',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add_rounded),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildConnectionStatusBar(ConnectionStatus status) {
    final colorScheme = Theme.of(context).colorScheme;
    if (status == ConnectionStatus.connected) return const SizedBox.shrink();
    String message = "서버 연결 중...";
    Color color = Colors.orange;
    if (status == ConnectionStatus.error ||
        status == ConnectionStatus.disconnected) {
      message = "서버 연결 확인 필요";
      color = colorScheme.error;
    }
    return Container(
      width: double.infinity,
      color: color.withValues(alpha: 0.1),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(strokeWidth: 2, color: color),
          ),
          const SizedBox(width: 12),
          Text(
            message,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceList(List<DeviceDashboardState> devices, bool isSkeleton) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(farmDashboardProvider),
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: devices.length,
        itemBuilder: (context, index) {
          final item = devices[index];
          return AppDeviceCard(
            name: item.device.name,
            deviceId: item.device.deviceId,
            status: item.latestStatus,
            onlineStatus: item.onlineStatus,
            lastUpdated: item.lastUpdated,
            onTap: isSkeleton
                ? null
                : () => context.push('/farm_dashboard/${item.device.deviceId}'),
            onPowerToggle: isSkeleton
                ? null
                : () {
                    final isOn = item.latestStatus?.isOn ?? false;
                    _showPowerConfirmDialog(item.device.name, isOn, () {
                      ref
                          .read(
                            mqttControlControllerProvider(
                              item.device.deviceId,
                            ).notifier,
                          )
                          .togglePower(!isOn);
                    });
                  },
            onEdit: isSkeleton ? null : () => _showDeviceManagementSheet(item),
          );
        },
      ),
    );
  }

  void _showDeviceManagementSheet(DeviceDashboardState item) {
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
                '기기 관리 (${item.device.name})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: Icon(
                Icons.edit_note_rounded,
                color: colorScheme.primary,
              ),
              title: const Text('기기 이름 변경'),
              onTap: () {
                Navigator.pop(context);
                _showRenameDialog(item);
              },
            ),
            ListTile(
              leading: Icon(Icons.rule_rounded, color: colorScheme.tertiary),
              title: const Text('자동화 규칙 관리'),
              onTap: () {
                Navigator.pop(context);
                context.push('/rules/${item.device.deviceId}');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever_rounded,
                color: colorScheme.error,
              ),
              title: const Text('기기 삭제'),
              onTap: () {
                Navigator.pop(context);
                _handleDeleteConfirm(item);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(DeviceDashboardState item) {
    final controller = TextEditingController(text: item.device.name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('기기 이름 변경'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: '새 이름',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          FilledButton(
            onPressed: () async {
              final newName = controller.text.trim();
              if (newName.isNotEmpty && newName != item.device.name) {
                final result = await ref
                    .read(farmDashboardProvider.notifier)
                    .renameDevice(item.device.deviceId, newName);
                if (context.mounted) {
                  if (result is Success) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("이름 변경 실패")));
                  }
                }
              } else {
                Navigator.pop(context);
              }
            },
            child: const Text('변경'),
          ),
        ],
      ),
    );
  }

  void _handleDeleteConfirm(DeviceDashboardState item) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('기기 삭제'),
        content: const Text('정말로 이 기기를 삭제하시겠습니까?\n모든 데이터와 규칙이 함께 삭제됩니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () async {
              final result = await ref
                  .read(farmDashboardProvider.notifier)
                  .removeDevice(item.device.deviceId);
              if (context.mounted && result is Success) Navigator.pop(context);
            },
            child: Text(
              '삭제',
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off_rounded,
            size: 80,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 16),
          const Text(
            '등록된 기기가 없습니다.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  List<DeviceDashboardState> _makeMockDevices() {
    return List.generate(
      3,
      (index) => DeviceDashboardState(
        device: DeviceEntity(deviceId: 'skeleton', name: 'Loading Device'),
        latestStatus: null,
        onlineStatus: DeviceOnlineStatus.connecting,
      ),
    );
  }
}
