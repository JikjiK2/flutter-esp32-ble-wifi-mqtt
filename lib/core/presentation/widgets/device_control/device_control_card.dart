import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';

class DeviceControlCard extends StatelessWidget {
  final LampStatus status;
  final Function(int) onLedModeChanged;
  final Function(int) onBrightModeChanged;
  final Function(int) onBrightnessChanged;

  const DeviceControlCard({
    super.key,
    required this.status,
    required this.onLedModeChanged,
    required this.onBrightModeChanged,
    required this.onBrightnessChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'LED 모드',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      status.ledMode == 0 ? '자동(온도)' : '수동(무드등)',
                      style: TextStyle(
                        color: status.ledMode == 0 ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Switch(
                      value: status.ledMode == 1,
                      onChanged: (val) {
                        HapticFeedback.mediumImpact();
                        onLedModeChanged(val ? 1 : 0);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24),
            const Text(
              '밝기 제어 방식',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(
                    value: 1,
                    label: Text('앱 제어'),
                    icon: Icon(Icons.touch_app),
                  ),
                  ButtonSegment(
                    value: 0,
                    label: Text('기기 제어'),
                    icon: Icon(Icons.tune),
                  ),
                ],
                selected: {status.brightMode},
                onSelectionChanged: (newSelection) {
                  HapticFeedback.lightImpact();
                  onBrightModeChanged(newSelection.first);
                },
              ),
            ),
            if (status.brightMode == 1) ...[
              const SizedBox(height: 16),
              Slider(
                value: status.brightness.toDouble(),
                max: 255,
                divisions: 255,
                label: status.brightness.round().toString(),
                onChanged: (v) {
                  onBrightnessChanged(v.toInt());
                },
              ),
            ] else ...[
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '기기에서 가변저항으로 밝기를 조절 중입니다.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
