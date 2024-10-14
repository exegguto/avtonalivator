import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  final ValueNotifier<int> _themeModeIndexNotifier = ValueNotifier<int>(0);

  int get themeModeIndex => _themeModeIndexNotifier.value;

  void setThemeMode(int index) {
    _themeModeIndexNotifier.value = index; // Устанавливаем новое значение
    notifyListeners(); // Уведомляем об изменениях
  }

  ThemeMode get themeMode {
    switch (_themeModeIndexNotifier.value) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.dark;
      case 2:
      default:
        return ThemeMode.system;
    }
  }
}