class ParseHelper {
  static double toDouble(String value) {
    return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
  }

  static int toInt(String value) {
    return int.tryParse(value) ?? 0;
  }
}
