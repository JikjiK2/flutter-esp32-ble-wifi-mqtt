import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_providers.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_control_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_usecase_providers.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BleDeviceListScreen extends ConsumerStatefulWidget {
  const BleDeviceListScreen({super.key});

  @override
  ConsumerState<BleDeviceListScreen> createState() => _BleDeviceListScreenState();
}

class _BleDeviceListScreenState extends ConsumerState<BleDeviceListScreen> {
  @override
  void initState() {
    super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScan();
    });
  }

  @override
  void dispose() {
        ref.read(stopDeviceScanUseCaseProvider).execute();
    super.dispose();
  }

  void _startAutoScan() {
    final adapterState = ref.read(bluetoothAdapterStateProvider).value;
    if (adapterState == BleAdapterState.on) {
      ref.invalidate(scanResultsProvider);
      ref.read(startDeviceScanUseCaseProvider).execute();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanResultsAsync = ref.watch(scanResultsProvider);
    final connectionState = ref.watch(bleConnectionProvider);
    final adapterState = ref.watch(bluetoothAdapterStateProvider).value ?? BleAdapterState.unknown;
    final isScanning = ref.watch(isScanningProvider).value ?? false;
    final bool isBluetoothOff = adapterState != BleAdapterState.on;
    final colorScheme = Theme.of(context).colorScheme;

        ref.listen(bluetoothAdapterStateProvider, (prev, next) {
      if (next.value == BleAdapterState.on) {
        _startAutoScan();
      }
    });

    ref.listen<AsyncValue<String?>>(bleConnectionProvider, (previous, next) {
      next.when(
        data: (connectedMacId) {
          if (connectedMacId != null) {
            final device = scanResultsAsync.value?.firstWhere(
              (d) => d.id == connectedMacId,
              orElse: () => BleDevice(name: 'Unknown Device', id: connectedMacId),
            );
            context.push('/ble_control/$connectedMacId?name=${device?.name}');
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('연결 실패: $error'),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('블루투스 기기 찾기', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isScanning ? Icons.stop_circle_rounded : Icons.sync_rounded),
            onPressed: isBluetoothOff ? null : () {
              if (isScanning) {
                ref.read(stopDeviceScanUseCaseProvider).execute();
              } else {
                ref.invalidate(scanResultsProvider);
                ref.read(startDeviceScanUseCaseProvider).execute();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (isScanning) const LinearProgressIndicator(minHeight: 2),
          if (isBluetoothOff) _buildBluetoothOffBanner(context),
          Expanded(
            child: Skeletonizer(
              enabled: scanResultsAsync.isLoading && !isBluetoothOff,
              child: isBluetoothOff
                  ? _buildEmptyState(context, '블루투스를 켜면 기기를 찾을 수 있습니다.', Icons.bluetooth_disabled_rounded)
                  : scanResultsAsync.when(
                      data: (devices) => _buildDeviceList(context, devices, connectionState),
                      loading: () => _buildDeviceList(context, _makeMockDevices(), connectionState),
                      error: (e, _) => _buildEmptyState(context, '스캔 중 오류 발생: $e', Icons.error_outline_rounded),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, String message, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Theme.of(context).colorScheme.outlineVariant),
          const SizedBox(height: 24),
          Text(message, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildBluetoothOffBanner(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(16),
      color: colorScheme.errorContainer.withValues(alpha: 0.2),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.error.withValues(alpha: 0.2)),
      ),
      child: ListTile(
        leading: Icon(Icons.warning_amber_rounded, color: colorScheme.error),
        title: Text('블루투스 비활성화됨', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: colorScheme.onErrorContainer)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: colorScheme.error, foregroundColor: colorScheme.onError, elevation: 0),
          onPressed: () => ref.read(turnOnBluetoothUseCaseProvider).execute(),
          child: const Text('활성화'),
        ),
      ),
    );
  }

  Widget _buildDeviceList(BuildContext context, List<BleDevice> devices, AsyncValue<String?> connectionState) {
    final colorScheme = Theme.of(context).colorScheme;
    if (devices.isEmpty) return _buildEmptyState(context, '주변에 무드등이 없습니다.', Icons.search_off_rounded);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        final connState = ref.watch(bleDeviceStateProvider(device.id)).value;
        final isConnected = connState == BleDeviceConnectionState.connected;
        final isConnecting = connectionState.isLoading && connectionState.asData?.value == device.id;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          color: colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: isConnected ? () => context.push('/ble_control/${device.id}?name=${device.name}') : null,
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: isConnected ? colorScheme.primaryContainer : colorScheme.surfaceContainerHighest,
              child: Icon(
                isConnected ? Icons.bluetooth_connected_rounded : Icons.bluetooth_rounded,
                color: isConnected ? colorScheme.primary : colorScheme.onSurfaceVariant,
              ),
            ),
            title: Text(device.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            subtitle: Row(
              children: [
                Text(device.id, style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant)),
                const SizedBox(width: 8),
                Icon(Icons.signal_cellular_alt, size: 12, color: _getRssiColor(device.rssi)),
                Text(' ${device.rssi} dBm', style: TextStyle(fontSize: 11, color: _getRssiColor(device.rssi))),
              ],
            ),
            trailing: isConnecting
                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isConnected ? colorScheme.surfaceContainerHighest : colorScheme.primary,
                      foregroundColor: isConnected ? colorScheme.onSurface : colorScheme.onPrimary,
                      elevation: 0,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      final notifier = ref.read(bleConnectionProvider.notifier);
                      if (isConnected) {
                        notifier.disconnect();
                      } else {
                        notifier.connect(device.id);
                      }
                    },
                    child: Text(isConnected ? '해제' : '연결'),
                  ),
          ),
        );
      },
    );
  }

  List<BleDevice> _makeMockDevices() {
    return List.generate(3, (index) => BleDevice(id: '00:00:00:00:00:0$index', name: 'Searching Device...', rssi: -100));
  }

  Color _getRssiColor(int rssi) {
    if (rssi > -60) return Colors.green;
    if (rssi > -80) return Colors.orange;
    return Colors.red;
  }
}
