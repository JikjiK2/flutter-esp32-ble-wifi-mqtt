import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuickPowerButton extends StatelessWidget {
  final bool isOn;
  final bool isOnline;
  final VoidCallback? onPressed;
  final double size;

  const QuickPowerButton({
    super.key,
    required this.isOn,
    required this.isOnline,
    this.onPressed,
    this.size = 26.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    final Color activeColor = Colors.green.shade600;
    final Color inactiveColor = colorScheme.outlineVariant;
    final Color offlineColor = colorScheme.outlineVariant.withValues(alpha: 0.3);

    final Color effectiveColor = isOnline 
        ? (isOn ? activeColor : inactiveColor) 
        : offlineColor;

    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Container(
          key: ValueKey(isOn),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: (isOnline && isOn) ? [
              BoxShadow(
                color: activeColor.withValues(alpha: 0.3),
                blurRadius: 12,
                spreadRadius: 2,
              )
            ] : null,
          ),
          child: Icon(
            isOn ? Icons.power_settings_new_rounded : Icons.power_off_rounded,
            color: effectiveColor,
            size: size,
          ),
        ),
      ),
      onPressed: isOnline ? () {
        HapticFeedback.mediumImpact();
        onPressed?.call();
      } : null,
    );
  }
}
