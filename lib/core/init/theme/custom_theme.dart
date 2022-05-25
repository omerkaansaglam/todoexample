import 'package:flutter/material.dart';

class CustomThemeData extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  void changeTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}
