import 'package:intl/intl.dart';

class AppFormatter {
  static final formatCurrency =
      NumberFormat.currency(locale: 'en_US', symbol: '₦');

  static final formatCurrencyNoDecimal =
      NumberFormat.currency(locale: 'en_US', symbol: '₦', decimalDigits: 0);
  static final formatNumber = NumberFormat.decimalPattern();

  static final dateFormatter = DateFormat('dd-MM-yyyy');
  static final monthYearFormatter = DateFormat('MM-yyyy');
  static final dateFormatterYMD = DateFormat('yyyy-MM-dd');
  static final dateFormatterMonth = DateFormat('MMM');

  static final kNumberFormat = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
  );
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
