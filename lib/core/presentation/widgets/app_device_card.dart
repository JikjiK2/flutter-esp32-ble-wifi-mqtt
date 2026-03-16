import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/blinking_status_dot.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/quick_power_button.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/sensor_info_tile.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_dashboard_controller.dart';

class AppDeviceCard extends StatelessWidget {
  final String name;
  final String deviceId;
  final LampStatus? status;
  final DeviceOnlineStatus onlineStatus;
  final DateTime? lastUpdated;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onPowerToggle;
  final VoidCallback? onEdit;

  const AppDeviceCard({
    super.key,
    required this.name,
    required this.deviceId,
    this.status,
    this.onlineStatus = DeviceOnlineStatus.connecting,
    this.lastUpdated,
    this.onTap,
    this.onLongPress,
    this.onPowerToggle,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isRecentlyUpdated =
        lastUpdated != null &&
        DateTime.now().difference(lastUpdated!).inSeconds < 15;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isRecentlyUpdated
              ? colorScheme.primary.withValues(alpha: 0.3)
              : colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(colorScheme, onlineStatus, isRecentlyUpdated),
              const Divider(height: 32),
              _buildSensorSection(colorScheme),
              if (lastUpdated != null)
                _buildFooter(colorScheme, isRecentlyUpdated),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    ColorScheme colorScheme,
    DeviceOnlineStatus onlineStatus,
    bool isRecentlyUpdated,
  ) {
    final bool isOnline = onlineStatus == DeviceOnlineStatus.online;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "ID: $deviceId",
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuickPowerButton(
              isOn: status?.isOn ?? false,
              isOnline: isOnline,
              onPressed: onPowerToggle,
            ),
            if (onEdit != null)
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  color: colorScheme.primary,
                  size: 22,
                ),
                onPressed: onEdit,
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildSensorSection(ColorScheme colorScheme) {
    final bool isOnline = onlineStatus == DeviceOnlineStatus.online;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SensorInfoTile(
          icon: Icons.thermostat_rounded,
          label: "온도",
          value: status != null
              ? status!.temperature.toStringAsFixed(1)
              : "--.-",
          unit: "°C",
          color: isOnline ? Colors.orange.shade700 : null,
        ),
        SensorInfoTile(
          icon: Icons.water_drop_rounded,
          label: "습도",
          value: status != null ? status!.humidity.toStringAsFixed(1) : "--",
          unit: "%",
          color: isOnline ? Colors.blue.shade600 : null,
        ),
        _buildConnectionBadge(colorScheme, onlineStatus),
      ],
    );
  }

  Widget _buildConnectionBadge(
    ColorScheme colorScheme,
    DeviceOnlineStatus status,
  ) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case DeviceOnlineStatus.online:
        color = Colors.green;
        label = "온라인";
        icon = Icons.wifi_tethering_rounded;
        break;
      case DeviceOnlineStatus.connecting:
        color = Colors.orange;
        label = "연결 확인 중";
        icon = Icons.sync_rounded;
        break;
      case DeviceOnlineStatus.offline:
        color = colorScheme.outline;
        label = "오프라인";
        icon = Icons.wifi_tethering_off_rounded;
        break;
      case DeviceOnlineStatus.error:
        color = Colors.redAccent;
        label = "통신 에러";
        icon = Icons.error_outline_rounded;
        break;
      case DeviceOnlineStatus.actionRequired:
        color = Colors.redAccent;
        label = "설정 확인 필요";
        icon = Icons.warning_amber_rounded;
        break;
    }

    return Column(
      children: [
        if (status == DeviceOnlineStatus.connecting)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: color),
          )
        else
          Icon(icon, size: 20, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(ColorScheme colorScheme, bool isRecentlyUpdated) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isRecentlyUpdated)
              const BlinkingStatusDot()
            else
              Icon(Icons.history_rounded, size: 12, color: colorScheme.outline),
            const SizedBox(width: 8),
            Text(
              isRecentlyUpdated
                  ? "실시간 데이터 수신 중"
                  : "마지막 동기화: ${_formatRelativeTime(lastUpdated!)}",
              style: TextStyle(
                color: isRecentlyUpdated
                    ? Colors.green.shade600
                    : colorScheme.onSurfaceVariant,
                fontSize: 10,
                fontWeight: isRecentlyUpdated
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatRelativeTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inSeconds < 60) return "방금 전";
    if (diff.inMinutes < 60) return "${diff.inMinutes}분 전";
    return DateFormat('HH:mm').format(time);
  }
}
