import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.light);

class ThemeController {
  static const _key = 'isDark';

  static Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_key) ?? false;
    themeNotifier.value =
        isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);

    themeNotifier.value =
        isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
