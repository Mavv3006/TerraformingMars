class ValueTooLowException implements Exception {
  const ValueTooLowException(this.message);

  final String message;

  String errorMessage() => message;
}
