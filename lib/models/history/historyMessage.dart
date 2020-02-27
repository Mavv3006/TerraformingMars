import 'package:flutter/material.dart';

import 'historyMessageType.dart';

class HistoryMessage {
  final String message;
  final int oldValue;
  final int newValue;
  final Type type;
  final HistoryMessageType historyMessageType;

  HistoryMessage({
    @required this.message,
    @required this.oldValue,
    @required this.newValue,
    @required this.type,
    @required this.historyMessageType,
  });
}

