import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/wifi_device_list.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_control_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_status_providers.dart';

class WifiReconfigScreen extends ConsumerStatefulWidget {
  final String deviceId;

  const WifiReconfigScreen({super.key, required this.deviceId});

  @override
  ConsumerState<WifiReconfigScreen> createState() => _WifiReconfigScreenState();
}

class _WifiReconfigScreenState extends ConsumerState<WifiReconfigScreen> {
  bool _isScanning = false;
  String? _selectedSsid;

  void _scanWifi() {
    setState(() {
      _isScanning = true;
    });

    ref
        .read(mqttControlControllerProvider(widget.deviceId).notifier)
        .requestWifiScan();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('기기에 주변 Wi-Fi 스캔을 요청했습니다.'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    Future.delayed(const Duration(seconds: 15), () {
      if (mounted && _isScanning) {
        setState(() => _isScanning = false);
      }
    });
  }

  void _onNetworkSelected(MqttSetupNetwork network) {
    setState(() => _selectedSsid = network.ssid);
    if (network.isSecure) {
      _showPasswordBottomSheet(network.ssid);
    } else {
      _confirmAndSave(network.ssid, "");
    }
  }

  void _showPasswordBottomSheet(String ssid) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) => _PasswordInputSheet(
        ssid: ssid,
        onConfirm: (password) => _confirmAndSave(ssid, password),
      ),
    );
  }

  void _confirmAndSave(String ssid, String password) {
    ref
        .read(mqttControlControllerProvider(widget.deviceId).notifier)
        .reconfigureWifi(ssid: ssid, password: password);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Row(
          children: [
            Icon(Icons.wifi_password_rounded, color: Colors.blue),
            SizedBox(width: 12),
            Text('WiFi 재설정 완료'),
          ],
        ),
        content: const Text(
          '기기가 새로운 WiFi 정보로 재연결을 시도합니다.\n잠시 후 대시보드에서 상태를 확인하세요.',
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final scanResultsAsync = ref.watch(mqttRemoteWifiScanResultsProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'WiFi 원격 재설정',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(colorScheme),
            const SizedBox(height: 32),
            _buildScanButton(colorScheme),
            const SizedBox(height: 24),
            _buildNetworkList(
              colorScheme,
              scanResultsAsync.value ?? [],
              scanResultsAsync.isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wifi_rounded, color: colorScheme.secondary),
              const SizedBox(width: 12),
              Text(
                '${widget.deviceId} WiFi 변경',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '기기 주변의 WiFi를 스캔하여 새로운 접속 정보를 설정합니다.',
            style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton(ColorScheme colorScheme) {
    return OutlinedButton.icon(
      onPressed: _isScanning ? null : _scanWifi,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      icon: _isScanning
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.refresh_rounded),
      label: Text(_isScanning ? '기기에서 WiFi 탐색 중...' : '주변 WiFi 검색 요청하기'),
    );
  }

  Widget _buildNetworkList(
    ColorScheme colorScheme,
    List<MqttSetupNetwork> networks,
    bool isLoading,
  ) {
    final showPlaceholder = !_isScanning && networks.isEmpty && !isLoading;

    if (showPlaceholder) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Icon(
                Icons.wifi_find_rounded,
                size: 48,
                color: colorScheme.outlineVariant,
              ),
              const SizedBox(height: 16),
              Text(
                '검색 버튼을 눌러 목록을 불러오세요.',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            '검색된 WiFi 목록',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
        ),
        Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: WifiDeviceList<MqttSetupNetwork>(
            networks: networks,
            isScanning: _isScanning || isLoading,
            filterDevices: false,
            getSsid: (n) => n.ssid,
            getRssi: (n) => n.rssi,
            getIsSecure: (n) => n.isSecure,
            selectedSsid: _selectedSsid,
            onNetworkTap: _onNetworkSelected,
          ),
        ),
      ],
    );
  }
}

class _PasswordInputSheet extends StatefulWidget {
  final String ssid;
  final Function(String password) onConfirm;

  const _PasswordInputSheet({required this.ssid, required this.onConfirm});

  @override
  State<_PasswordInputSheet> createState() => _PasswordInputSheetState();
}

class _PasswordInputSheetState extends State<_PasswordInputSheet> {
  final _controller = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        28,
        24,
        28,
        MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: colorScheme.secondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.ssid,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _controller,
            obscureText: _obscure,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "WiFi 비밀번호",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              widget.onConfirm(_controller.text.trim());
            },
            icon: const Icon(Icons.send_rounded),
            label: const Text(
              "원격 설정 전송",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
