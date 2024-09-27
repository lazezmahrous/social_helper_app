// ignore_for_file: file_names, unused_element
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class ThemeClass {
  static ThemeMode _currentThemeMode = ThemeMode.light; // تعريف المتغير هنا

  static ThemeMode get currentThemeMode => _currentThemeMode;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.light(primary: ColorsManager.secondBlueColor),
    iconTheme: IconThemeData(
      color: ColorsManager.secondBlueColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.dark(primary: ColorsManager.darkBlue),
  );

  static Future<void> toggleThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentThemeMode =
        _currentThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await prefs.setInt('theme_mode', _currentThemeMode.index);
  }

  static Future<ThemeMode> getSavedThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return ThemeMode.values[prefs.getInt('theme_mode') ?? 0];
  }
  
}

ThemeClass _themeClass = ThemeClass();
