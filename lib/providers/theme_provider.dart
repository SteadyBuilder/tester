import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // 기본적으로 시스템 설정 따름

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
