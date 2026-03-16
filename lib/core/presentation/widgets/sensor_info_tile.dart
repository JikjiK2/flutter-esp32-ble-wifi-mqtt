import 'package:flutter/material.dart';

class SensorInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? color;
  final String? unit;

  const SensorInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.color,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveColor = color ?? colorScheme.onSurfaceVariant;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: effectiveColor),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colorScheme.onSurface,
              ),
            ),
            if (unit != null) ...[
              const SizedBox(width: 2),
              Text(
                unit!,
                style: TextStyle(
                  fontSize: 10,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
