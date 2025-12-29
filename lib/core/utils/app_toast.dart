import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum ToastType { success, error, info }

class AppToast {
  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
  }) {
    final backgroundColor = _getBackgroundColor(context, type);
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.darkPrimaryText
        : AppColors.lightPrimaryText;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    show(context, message: message, type: ToastType.success);
  }

  static void showError(BuildContext context, String message) {
    show(context, message: message, type: ToastType.error);
  }

  static void showInfo(BuildContext context, String message) {
    show(context, message: message, type: ToastType.info);
  }

  static Color _getBackgroundColor(BuildContext context, ToastType type) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (type) {
      case ToastType.success:
        return isDark ? Colors.green.shade700 : Colors.green.shade400;
      case ToastType.error:
        return isDark ? Colors.red.shade700 : Colors.red.shade400;
      case ToastType.info:
        return isDark ? AppColors.darkSurface : AppColors.lightSurface;
    }
  }
}
