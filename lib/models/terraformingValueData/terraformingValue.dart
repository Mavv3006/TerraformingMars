import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

import '../defaultValue.dart';

abstract class TerraformingValue extends ChangeNotifier {
  TerraformingValue(this._title);

  final String _title;
  int value = DefaultValue.defaultTerraformingStartValue;

  bool get isValueGreaterThenZero => value > 0;

  String get title => _title;

  String get valueToString => "${value}";

  void incrementValue() {
    value++;
    notifyListeners();
  }

  void decrementValue() {
    if (isValueGreaterThenZero) value--;
    notifyListeners();
  }

  void nextRound() {
    incrementValue();
  }

  void undo(HistoryMessage historyMessage) {
    if (historyMessage.historyMessageType == HistoryMessageType.VALUE) {
      undoValue(historyMessage);
    }
  }

  void undoValue(HistoryMessage historyMessage) {
    if (historyMessage.newValue == this.value) {
      this.value = historyMessage.oldValue;
    } else {
      throw UnequalValueException("HistoryMessage.newValue != this.value");
    }
  }
}
