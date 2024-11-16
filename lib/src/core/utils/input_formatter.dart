// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    } else {
      // Remove all characters & alphabet
      final onlyNumber = newValue.text.replaceAll(RegExp('[^0-9]'), '');

      // Return the formatted value as the new text value and position
      return TextEditingValue(
        text: onlyNumber,
        selection: TextSelection.collapsed(offset: onlyNumber.length),
      );
    }
  }
}
