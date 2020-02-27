class EmptyHistoryException implements Exception {
  final String message;

  EmptyHistoryException(this.message);

  String errorMessage() => message;
}
