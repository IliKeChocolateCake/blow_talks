import 'package:blow_talks/main.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) {
  final mode = appThemeMode.value;
  if (mode == ThemeMode.dark) return true;
  if (mode == ThemeMode.light) return false;
  // ThemeMode.system — follows device setting
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}