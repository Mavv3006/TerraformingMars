class UnequalValueException implements Exception {
  final String message;

  UnequalValueException(this.message);

  String errorMessage() => message;
}
