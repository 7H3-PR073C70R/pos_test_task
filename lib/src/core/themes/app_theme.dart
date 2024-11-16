import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.fontSize,
            fontWeight: FontWeight.w700,
            color: AppColors.kcText,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
