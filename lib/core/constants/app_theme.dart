import 'package:flutter/material.dart';
import '/core/constants/app_colors.dart';

import 'font_family.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.openSans,
  brightness: Brightness.light,
  primaryColor: const Color(0xFF1C476B),
  primaryColorBrightness: Brightness.light,
  iconTheme: const IconThemeData(color: Colors.black),
  colorScheme:
      ColorScheme.fromSwatch(primarySwatch: AppColors.primaryColor).copyWith(
    secondary: AppColors.primaryColor[100],
  ),
);

final ThemeData darkThemeData = ThemeData(
  fontFamily: FontFamily.openSans,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1C476B),
  primaryColorBrightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Colors.white),
  colorScheme:
      ColorScheme.fromSwatch(primarySwatch: AppColors.primaryColor).copyWith(
    secondary: AppColors.primaryColor[100],
  ),
);
