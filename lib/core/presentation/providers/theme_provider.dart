import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  late SharedPreferences _prefs;

  @override
  ThemeMode build() {
    _init();
    return ThemeMode.system;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    final themeIndex = _prefs.getInt('theme_mode');
    if (themeIndex != null) {
      state = ThemeMode.values[themeIndex];
    }
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    _prefs.setInt('theme_mode', state.index);
  }
}
