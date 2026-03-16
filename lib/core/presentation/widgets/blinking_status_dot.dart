import 'package:flutter/material.dart';

class BlinkingStatusDot extends StatefulWidget {
  final Color color;
  final double size;

  const BlinkingStatusDot({
    super.key, 
    this.color = Colors.green,
    this.size = 8.0,
  });

  @override
  State<BlinkingStatusDot> createState() => _BlinkingStatusDotState();
}

class _BlinkingStatusDotState extends State<BlinkingStatusDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.4),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
