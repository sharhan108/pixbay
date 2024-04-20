extension StringExtension on String {
  String shortenNumber() {
    double number = double.tryParse(this) ?? 0;
    if (number >= 1000) {
      double abbreviated = number / 1000;
      return '${abbreviated.toStringAsFixed(1)}k';
    } else {
      return this;
    }
  }
}
