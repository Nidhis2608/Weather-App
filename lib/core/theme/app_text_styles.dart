import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle headline(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: isDark ? AppColors.darkPrimaryText : AppColors.lightPrimaryText,
    );
  }

  static TextStyle body(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextStyle(
      fontSize: 16,
      color: isDark
          ? AppColors.darkSecondaryText
          : AppColors.lightSecondaryText,
    );
  }
}
