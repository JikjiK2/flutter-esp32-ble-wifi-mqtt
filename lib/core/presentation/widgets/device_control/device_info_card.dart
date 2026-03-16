import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';

class DeviceInfoCard extends StatelessWidget {
  final LampStatus status;
  final String updateInterval;

  const DeviceInfoCard({
    super.key, 
    required this.status,
    this.updateInterval = '2초',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSensorItem(
                  Icons.thermostat,
                  '온도',
                  '${status.temperature.toStringAsFixed(1)} °C',
                  Colors.orange,
                ),
                _buildSensorItem(
                  Icons.water_drop,
                  '습도',
                  '${status.humidity.toStringAsFixed(0)} %',
                  Colors.blue,
                ),
                _buildSensorItem(
                  Icons.wb_incandescent_rounded,
                  '밝기',
                  status.isOn ? '${status.brightness}' : 'OFF',
                  status.isOn ? Colors.amber : Colors.grey,
                ),
                _buildSensorItem(
                  Icons.wifi_tethering_rounded, 
                  '기기-공유기',
                  '${status.rssi} dBm',
                  _getRssiColor(status.rssi),
                  isRssi: true,
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: status.isOn ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  status.isOn ? '장치 작동 중' : '장치 대기 중 (모니터링 중)',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(width: 12),
                Text(
                  '|  갱신 주기: $updateInterval',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getRssiColor(int rssi) {
    if (rssi >= -65) return Colors.green;
    if (rssi >= -85) return Colors.orange;
    return Colors.red;
  }

  Widget _buildSensorItem(
    IconData icon,
    String label,
    String value,
    Color color, {
    bool isRssi = false,
  }) {
    return Column(
      children: [
        isRssi 
          ? Tooltip(
              message: '기기와 공유기 사이의 무선 신호 세기입니다.\n값이 낮을수록 연결이 불안정할 수 있습니다.',
              showDuration: const Duration(seconds: 3),
              child: Icon(icon, color: color, size: 24),
            )
          : Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
