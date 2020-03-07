class ValueTooLowException implements Exception {
  final String message;

  ValueTooLowException(this.message);

  String errorMessage() => message;

}