import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/action/action_type.dart';

import 'historyMessageType.dart';

class HistoryMessage {
  final String message;
  final int oldValue;
  final int newValue;
  final int production;
  final Type type;
  final HistoryMessageType historyMessageType;
  final ActionType actionType;


  HistoryMessage({
    @required this.message,
    @required this.oldValue,
    @required this.newValue,
    @required this.type,
    @required this.historyMessageType,
    this.actionType,
    this.production,
  }) : assert(historyMessageType == HistoryMessageType.ACTION
            ? actionType != null
            : actionType == null);

  @override
  String toString() {
    return 'HistoryMessage{message: $message, oldValue: $oldValue, newValue: $newValue, production: $production, type: $type, historyMessageType: $historyMessageType, actionType: $actionType}';
  }
}
