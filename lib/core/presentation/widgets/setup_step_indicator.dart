import 'package:flutter/material.dart';

class SetupStepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color? activeColor;

  const SetupStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = activeColor ?? Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(totalSteps * 2 - 1, (index) {
        if (index % 2 == 0) {
          final stepNum = (index ~/ 2) + 1;
          final bool isCompleted = stepNum < currentStep;
          final bool isActive = stepNum == currentStep;

          return _buildStepIcon(context, themeColor, stepNum, isActive, isCompleted);
        } else {
          final stepNumBeforeLine = (index ~/ 2) + 1;
          final bool isCompleted = stepNumBeforeLine < currentStep;
          return _buildLine(themeColor, isCompleted);
        }
      }),
    );
  }

  Widget _buildStepIcon(BuildContext context, Color color, int stepNum, bool isActive, bool isCompleted) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive || isCompleted ? color : Colors.grey.shade300,
        shape: BoxShape.circle,
        boxShadow: isActive 
          ? [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 8, spreadRadius: 2)]
          : [],
      ),
      child: Center(
        child: isCompleted
            ? const Icon(Icons.check, size: 18, color: Colors.white)
            : Text(
                '$stepNum',
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade600,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildLine(Color color, bool isCompleted) {
    return Expanded(
      child: Container(
        height: 3,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isCompleted ? color : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2)
        ),
      ),
    );
  }
}
