extension StringExtension on String {
  String get initials =>
      isNotEmpty ? trim().split(' ').map((l) => l[0]).take(2).join() : '';

  String get obscurePhone => length == 10
      ? '0$this'.replaceRange(4, 8, '*' * 4)
      : replaceRange(4, 8, '*' * 4);

  String get obscureEmail {
    if (!contains('@')) return this;
    final parts = split('@');
    return replaceRange(2, parts[0].length - 1, '*' * 5);
  }

  String get capitalizeFirst =>
      isEmpty ? '' : this[0].toUpperCase() + substring(1);

  bool get validateEmail => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(this);
}
