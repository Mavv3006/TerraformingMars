class UnequalValueException implements Exception {
  const UnequalValueException(this.message);

  final String message;

  String errorMessage() => message;
}
