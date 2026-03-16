import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum GoogleButtonTheme { light, dark, neutral }
enum GoogleButtonShape { rectangular, pill }
enum GoogleButtonAction { signIn, signUp, continueAction }
enum GoogleButtonLocale { ko, en }

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final GoogleButtonTheme theme;
  final GoogleButtonShape shape;
  final GoogleButtonAction action;
  final GoogleButtonLocale locale;
  final double scale;

  const GoogleLoginButton({
    super.key,
    this.onPressed,
    this.theme = GoogleButtonTheme.light,
    this.shape = GoogleButtonShape.rectangular,
    this.action = GoogleButtonAction.signIn,
    this.locale = GoogleButtonLocale.ko,
    this.scale = 1.0,
  });

  String get _buttonText {
    if (locale == GoogleButtonLocale.ko) {
      switch (action) {
        case GoogleButtonAction.signIn:
          return 'Google 계정으로 로그인';
        case GoogleButtonAction.signUp:
          return 'Google 계정으로 가입하기';
        case GoogleButtonAction.continueAction:
          return 'Google 계정으로 계속하기';
      }
    } else {
      switch (action) {
        case GoogleButtonAction.signIn:
          return 'Sign in with Google';
        case GoogleButtonAction.signUp:
          return 'Sign up with Google';
        case GoogleButtonAction.continueAction:
          return 'Continue with Google';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final isIOS = platform == TargetPlatform.iOS;

    final double baseHeight = isIOS ? 44 : 40;
    final double height = baseHeight * scale;
    final double iconSize = 18 * scale;
    final double textSize = 14 * scale;
    final double borderRadius = shape == GoogleButtonShape.pill ? height / 2 : 4 * scale;

    Color backgroundColor;
    Color textColor;
    BorderSide borderSide;

    switch (theme) {
      case GoogleButtonTheme.dark:
        backgroundColor = const Color(0xFF131314);
        textColor = const Color(0xFFE3E3E3);
        borderSide = const BorderSide(color: Color(0xFF8E918F), width: 1);
        break;
      case GoogleButtonTheme.neutral:
        backgroundColor = const Color(0xFFF2F2F2);
        textColor = const Color(0xFF1F1F1F);
        borderSide = BorderSide.none;
        break;
      case GoogleButtonTheme.light:
      backgroundColor = const Color(0xFFFFFFFF);
        textColor = const Color(0xFF1F1F1F);
        borderSide = const BorderSide(color: Color(0xFF747775), width: 1);
        break;
    }

    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 24 * scale),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSide,
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.all(textColor.withValues(alpha: 0.08)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/google_logo.svg',
              height: iconSize,
              width: iconSize,
            ),
            SizedBox(width: 16 * scale),
            Text(
              _buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
