import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? iconColor;

  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveIconColor = iconColor ?? colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: effectiveIconColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: effectiveIconColor, size: 20),
        ),
        title: Text(
          label,
          style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
