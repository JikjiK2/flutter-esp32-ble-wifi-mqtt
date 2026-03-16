import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/core/domain/entities/device_status.dart';

class DeviceColorPickerCard extends StatelessWidget {
  final LampStatus status;
  final Function(int) onColorChanged;
  final Function(int) onModeChanged;

  const DeviceColorPickerCard({
    super.key,
    required this.status,
    required this.onColorChanged,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isAutoMode = status.ledMode == 0;

    final List<int> presetColors = [
      0xFFFF0000,       0xFF00FF00,       0xFF0000FF,       0xFFFFFF00,       0xFFFF00FF,       0xFF00FFFF,       0xFFFFFFFF,     ];

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
                Icon(Icons.palette_rounded, color: colorScheme.primary, size: 20),
                const SizedBox(width: 12),
                Text('LED 조명 모드', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface)),
              ],
            ),
            const SizedBox(height: 24),

            SegmentedButton<int>(
              segments: const [
                ButtonSegment(
                  value: 0, 
                  label: Text('자동 (온도기반)'), 
                  icon: Icon(Icons.auto_awesome_rounded)
                ),
                ButtonSegment(
                  value: 1, 
                  label: Text('수동 (색상지정)'), 
                  icon: Icon(Icons.touch_app_rounded)
                ),
              ],
              selected: {status.ledMode},
              onSelectionChanged: (Set<int> newSelection) {
                onModeChanged(newSelection.first);
              },
              style: SegmentedButton.styleFrom(
                selectedBackgroundColor: colorScheme.primary.withValues(alpha: 0.2),
                selectedForegroundColor: colorScheme.primary,
              ),
            ),

            if (!isAutoMode) ...[
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('수동 색상 선택', style: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: presetColors.map((colorValue) {
                      final bool isSelected = (status.color & 0xFFFFFF) == (colorValue & 0xFFFFFF);
                      return GestureDetector(
                        onTap: () => onColorChanged(colorValue & 0xFFFFFF),
                        child: Container(
                          width: 38, height: 38,
                          decoration: BoxDecoration(
                            color: Color(colorValue),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? colorScheme.primary : Colors.grey.withValues(alpha: 0.3),
                              width: isSelected ? 3 : 1,
                            ),
                            boxShadow: isSelected ? [
                              BoxShadow(color: colorScheme.primary.withValues(alpha: 0.4), blurRadius: 8, spreadRadius: 1)
                            ] : null,
                          ),
                          child: isSelected ? const Icon(Icons.check, size: 20, color: Colors.white) : null,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ] else ...[
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
                ),
                child: Column(
                  children: [
                    Icon(Icons.thermostat_rounded, color: colorScheme.primary, size: 24),
                    const SizedBox(height: 8),
                    Text(
                      '지능형 자동 온도 모드 활성화 중',
                      style: TextStyle(fontSize: 13, color: colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '기기가 주변 온도에 맞춰 최적의 조명색을 직접 결정합니다.',
                      style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
