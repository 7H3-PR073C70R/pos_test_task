import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension BuildContextExtension on BuildContext {
  void showSnackBar({
    required String message,
    SnackBarType type = SnackBarType.success,
  }) {
    return showTopSnackBar(
      Overlay.of(this),
      switch (type) {
        SnackBarType.error => CustomSnackBar.error(
            message: message,
            backgroundColor: AppColors.kcError,
            textStyle: TextStyle(
              fontSize: 12.fontSize,
              fontWeight: FontWeight.w500,
              color: AppColors.kcGray100,
            ),
            borderRadius: BorderRadius.circular(8.radius),
          ),
        SnackBarType.success => CustomSnackBar.success(
            message: message,
            backgroundColor: AppColors.kcSuccess,
            textStyle: TextStyle(
              fontSize: 12.fontSize,
              fontWeight: FontWeight.w500,
              color: AppColors.kcGray100,
            ),
            borderRadius: BorderRadius.circular(8.radius),
          ),
        SnackBarType.info => UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.height,
                horizontal: 16.width,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.radius),
                color: AppColors.kcGray900,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: textTheme.displayLarge?.copyWith(
                      fontSize: 12.fontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kcGray100,
                    ),
                  ),
                  AppSpacing.horizontalSpaceMedium,
                  // SvgImageAsset(
                  //   AppAssetPath.check,
                  //   height: 20.radius,
                  //   width: 20.radius,
                  // ),
                ],
              ),
            ),
          ),
      },
    );
  }
}

enum SnackBarType {
  error,
  success,
  info,
}
