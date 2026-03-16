import 'package:flutter/material.dart';

class WizardStepLayout extends StatelessWidget {
  final String title;
  final String helpText;
  final String nextLabel;
  final Widget child;
  final Widget? bottom;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final Color? accentColor;

  const WizardStepLayout({
    super.key,
    required this.title,
    required this.helpText,
    required this.child,
    this.nextLabel = "다음",
    this.onNext,
    this.onBack,
    this.bottom,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = accentColor ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: effectiveColor.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        helpText,
                        style: const TextStyle(fontSize: 13, color: Colors.blueGrey, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 32),
                    child,
                    if (bottom != null) ...[
                      const SizedBox(height: 16),
                      bottom!,
                    ],
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                children: [
                  if (onBack != null)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          onBack!();
                        },
                        child: const Text("이전"),
                      ),
                    ),
                  if (onBack != null) const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: effectiveColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: onNext == null ? null : () {
                        FocusScope.of(context).unfocus();
                        onNext!();
                      },
                      child: Text(nextLabel),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
