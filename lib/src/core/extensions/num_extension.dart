import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension ResponsiveExtension on num {
  double get width => w;

  double get height => h;

  double get fontSize => sp;

  double get radius => r;
}

extension NumExtension on num {
  String get toAmount =>
      NumberFormat.currency(symbol: r'$').format(this);

  String get formattedNum {
    if (this < 1000) {
      return toString();
    }

    final suffixes = ['', 'k', 'M', 'B', 'T'];
    final magnitudeIndex = (this == 0)
        ? 0
        : (log(abs()) / log(1000)).floor().clamp(0, suffixes.length - 1);
    final suffix = suffixes[magnitudeIndex];
    final formattedData = (this / pow(1000, magnitudeIndex)).toStringAsFixed(
      magnitudeIndex > 0 ? 0 : 1,
    );

    return formattedData + suffix;
  }
}
