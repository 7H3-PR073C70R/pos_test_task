import 'package:flutter/material.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    required this.text,
    required this.color,
    required this.onTap,
    super.key,
    this.padding,
    this.fontSize,
    this.radius,
    this.icon,
  });
  final String text;
  final Color color;
  final double? padding;
  final double? fontSize;
  final double? radius;
  final IconData? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 10.radius),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 6.radius),
          border: Border.all(
            color: color,
          ),
        ),
        child: icon != null
            ? Icon(
                icon,
                color: color,
              )
            : Text(
                text,
                style: context.textTheme.titleMedium!.copyWith(
                  color: color,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}
