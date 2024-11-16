import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard({required this.iconData, required this.text, required this.onTap, super.key});
final IconData iconData;
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(iconData, size: 24.radius),
          AppSpacing.setHorizontalSpace(16),
          Text(text,
            style: context.textTheme.titleMedium!.copyWith(
              fontSize: 16.fontSize,
            ),),
        ],
      ),
    );
  }
}
