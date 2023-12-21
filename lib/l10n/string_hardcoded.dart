extension StringHardcoded on String {
  String get hardcoded => this;
}

extension StringExtension on String {
  String capitalize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()} ';
}
