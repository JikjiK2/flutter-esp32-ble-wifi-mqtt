import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/blinking_status_dot.dart';

class DeviceStatusCard extends StatelessWidget {
  final LampStatus status;
  final bool isBle;

  const DeviceStatusCard({
    super.key, 
    required this.status,
    this.isBle = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSensorItem(
                  Icons.thermostat_rounded,
                  '온도',
                  status.temperature.toStringAsFixed(1),
                  '°C',
                  Colors.orange.shade700,
                ),
                _buildSensorItem(
                  Icons.water_drop_rounded,
                  '습도',
                  status.humidity.toStringAsFixed(1),
                  '%',
                  Colors.blue.shade600,
                ),
                _buildSensorItem(
                  Icons.wb_incandescent_rounded,
                  '밝기',
                  status.isOn ? '${status.brightness}' : 'OFF',
                  '',
                  status.isOn ? Colors.amber.shade700 : Colors.grey,
                ),
                _buildSensorItem(
                  isBle ? Icons.bluetooth_searching_rounded : Icons.wifi_tethering_rounded,
                  '신호강도',
                  '${status.rssi}',
                  'dBm',
                  _getRssiColor(status.rssi),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildStatusFooter(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorItem(IconData icon, String label, String value, String unit, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (unit.isNotEmpty) ...[
              const SizedBox(width: 2),
              Text(unit, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildStatusFooter(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlinkingStatusDot(),
          const SizedBox(width: 8),
          Text(
            status.isOn ? '장치 작동 중' : '모니터링 대기 중',
            style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(width: 12),
          Icon(Icons.timer_outlined, size: 12, color: colorScheme.outline),
          const SizedBox(width: 4),
          Text('실시간 갱신', style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Color _getRssiColor(int rssi) {
    if (rssi >= -60) return Colors.green;
    if (rssi >= -80) return Colors.orange;
    return Colors.red;
  }
}
