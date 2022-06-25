import 'package:flutter/material.dart';

extension DarkMode on WidgetsBinding {
  bool get isDarkMode => WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
}
