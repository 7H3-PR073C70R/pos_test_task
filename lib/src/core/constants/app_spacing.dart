import 'package:flutter/material.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';

class AppSpacing {
  const AppSpacing._();

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Vertical Spacing
  static SizedBox verticalSpaceTiny = SizedBox(height: 4.height);
  static SizedBox verticalSpaceSmall = SizedBox(height: 8.height);
  static SizedBox verticalSpaceMedium = SizedBox(height: 16.height);
  static SizedBox verticalSpaceLarge = SizedBox(height: 24.height);
  static SizedBox verticalSpaceHuge = SizedBox(height: 30.height);
  static SizedBox verticalSpaceMassive = SizedBox(height: 40.height);

  static SizedBox setVerticalSpace(num h) => SizedBox(height: h.height);

  // Vertical Heights.
  static double verticalValueTiny = 4.height;
  static double verticalValueSmall = 8.height;

  // Horizontal Spacing.
  static SizedBox horizontalSpaceTiny = SizedBox(width: 4.width);
  static SizedBox horizontalSpaceSmall = SizedBox(width: 8.width);
  static SizedBox horizontalSpaceMedium = SizedBox(width: 16.width);
  static SizedBox horizontalSpaceLarge = SizedBox(width: 24.width);
  static SizedBox horizontalSpaceHuge = SizedBox(width: 32.width);
  static SizedBox horizontalSpaceMassive = SizedBox(width: 40.width);

  static SizedBox setHorizontalSpace(num w) => SizedBox(width: w.width);

  static double horizontalSpacing = 20.width;
}
