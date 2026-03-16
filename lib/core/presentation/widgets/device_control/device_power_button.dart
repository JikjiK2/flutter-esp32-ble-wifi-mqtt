import 'package:flutter/material.dart';

class DevicePowerButton extends StatelessWidget {
  final bool isOn;
  final VoidCallback onTap;
  final Color activeColor;
  final String statusText;

  const DevicePowerButton({
    super.key,
    required this.isOn,
    required this.onTap,
    this.activeColor = Colors.green,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuart,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isOn 
                  ? activeColor.withValues(alpha: 0.15) 
                  : colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
              shape: BoxShape.circle,
              boxShadow: isOn 
                ? [BoxShadow(color: activeColor.withValues(alpha: 0.3), blurRadius: 30, spreadRadius: 5)]
                : [],
              border: Border.all(
                color: isOn ? activeColor.withValues(alpha: 0.2) : colorScheme.outlineVariant.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
            child: Icon(
              Icons.power_settings_new_rounded,
              size: 32,
              color: isOn ? activeColor : colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            statusText,
            key: ValueKey<bool>(isOn),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: isOn ? activeColor : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
