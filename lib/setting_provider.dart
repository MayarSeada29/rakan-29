import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  changeTheme(ThemeMode newMode) {
    if (currentTheme == newMode) return;
    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
