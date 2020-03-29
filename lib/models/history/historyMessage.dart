import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/action/action_type.dart';

import 'historyMessageType.dart';

class HistoryMessage {
  final String message;
  final HistoryMessageValue oldValue;
  final HistoryMessageValue newValue;
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
  })  : assert(historyMessageType == HistoryMessageType.ACTION
            ? actionType != null
            : actionType == null),
        assert( // oldValue == intValue
          oldValue.intValue != null
              ? (oldValue.boolValue == null &&
                  newValue.boolValue == null &&
                  newValue.intValue != null)
              : (oldValue.boolValue != null &&
                  newValue.boolValue != null &&
                  newValue.intValue == null),
        ),
        assert( // oldValue == boolValue
          oldValue.boolValue != null
              ? (oldValue.intValue == null &&
                  newValue.boolValue != null &&
                  newValue.intValue == null)
              : (oldValue.boolValue == null &&
                  newValue.boolValue == null &&
                  newValue.intValue != null),
        ),
        assert( // newValue == intValue
          newValue.intValue != null
              ? (oldValue.boolValue == null &&
                  newValue.boolValue == null &&
                  oldValue.intValue != null)
              : (oldValue.boolValue != null &&
                  newValue.boolValue != null &&
                  oldValue.intValue == null),
        ),
        assert(  // newValue == boolValue
          newValue.boolValue != null
              ? (oldValue.boolValue != null &&
                  oldValue.intValue == null &&
                  newValue.intValue == null)
              : (oldValue.boolValue == null &&
                  oldValue.intValue != null &&
                  newValue.intValue != null),
        );

  @override
  String toString() {
    return 'HistoryMessage{message: $message, oldValue: $oldValue, newValue: $newValue, production: $production, type: $type, historyMessageType: $historyMessageType, actionType: $actionType}';
  }
}

class HistoryMessageValue {
  int intValue;
  bool boolValue;

  HistoryMessageValue({this.intValue, this.boolValue});

  @override
  String toString() {
    return 'HistoryMessageValue{intValue: $intValue, boolValue: $boolValue}';
  }
}
