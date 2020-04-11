class EmptyHistoryException implements Exception {
  const EmptyHistoryException(this.message);

  final String message;

  String errorMessage() => message;
}
