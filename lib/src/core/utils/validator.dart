import 'package:flutter/material.dart';

extension ValidationExtension on BuildContext {
  String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field cannot be empty' : null;

  String? validateFieldNotNull<T>(T? value) =>
      value == null ? 'Field cannot be empty' : null;

  String? validateFullName<T>(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    if (value.split(' ').length < 2) return 'Please enter your FULL NAME';
    return null;
  }

  String? validateEmailAddress(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String? validatePassword(String? value) {
    if (value == null) return 'Field cannot be empty';
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (!RegExp(pattern).hasMatch(value)) return 'Invalid Password';
    return null;
  }

  String? validateConfirmPassword({String? password, String? confirmPassword}) {
    if (confirmPassword == null) return 'Field cannot be empty';
    if (password != confirmPassword) return 'Password mismatch';
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null) return 'Field cannot be empty';
    if (value.length < 11) return 'Invalid Phone Number';
    return null;
  }

  String? validateBVN(String? value) {
    if (value == null) return 'Field cannot be empty';
    if (value.length < 11) return 'Invalid BVN Number';
    return null;
  }
}
