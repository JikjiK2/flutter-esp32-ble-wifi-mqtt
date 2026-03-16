import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';

class DeviceControlSettingsCard extends StatelessWidget {
  final LampStatus status;
  final Function(int) onBrightnessChanged;
  final Function(int) onBrightModeChanged;

  const DeviceControlSettingsCard({
    super.key,
    required this.status,
    required this.onBrightnessChanged,
    required this.onBrightModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isAppControl = status.brightMode == 1;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.settings_suggest_rounded, color: colorScheme.primary, size: 20),
                const SizedBox(width: 12),
                Text('밝기 제어 설정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface)),
              ],
            ),
            const SizedBox(height: 24),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('기기(가변저항)'), icon: Icon(Icons.settings_input_component_rounded)),
                ButtonSegment(value: 1, label: Text('앱(슬라이더)'), icon: Icon(Icons.phonelink_setup_rounded)),
              ],
              selected: {status.brightMode},
              onSelectionChanged: (Set<int> newSelection) => onBrightModeChanged(newSelection.first),
              style: SegmentedButton.styleFrom(
                selectedBackgroundColor: colorScheme.primary.withValues(alpha: 0.2),
                selectedForegroundColor: colorScheme.primary,
              ),
            ),
            
            if (isAppControl) ...[
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('앱 설정 밝기 (0-255)', style: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant)),
                      Text('${status.brightness}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorScheme.primary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: colorScheme.primary,
                      inactiveTrackColor: colorScheme.primary.withValues(alpha: 0.1),
                      thumbColor: colorScheme.primary,
                    ),
                    child: Slider(
                      value: status.brightness.toDouble().clamp(0, 255),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (val) => onBrightnessChanged(val.round()),
                    ),
                  ),
                ],
              ),
            ] else ...[
              const SizedBox(height: 24),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info_outline_rounded, size: 16, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      Text('기기의 물리 가변저항으로 조절 중입니다.', style: TextStyle(fontSize: 12, color: colorScheme.primary, fontWeight: FontWeight.w500)),
                    ],
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
