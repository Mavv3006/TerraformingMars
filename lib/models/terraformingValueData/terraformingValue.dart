import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

import '../defaultValue.dart';

abstract class TerraformingValue extends ChangeNotifier {
  TerraformingValue(this._title);

  String _getHistoryMessageText() {
    return "${this.title} - ";
  }

  String getHistoryMessgeProductionText() {
    return _getHistoryMessageText() + HistoryMessageTypeString.PRODUCTION;
  }

  String getHistoryMessgeValueText() {
    return _getHistoryMessageText() + HistoryMessageTypeString.VALUE;
  }

  String getHistoryMessgeNextRoundText() {
    return _getHistoryMessageText() + HistoryMessageTypeString.NEXT_ROUND;
  }

  History history;

  final String _title;
  int value = DefaultValue.defaultTerraformingStartValue;

  bool get isValueGreaterThenZero => value > 0;

  String get title => _title;

  String get valueToString => "${value}";

  void incrementValue();

  @protected
  void incrementValueWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeValueText(),
        oldValue: value,
        newValue: ++value,
        type: type,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    notifyListeners();
  }

  void decrementValue();

  @protected
  void decrementValueWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeValueText(),
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: type,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    notifyListeners();
  }

  void nextRound() {
    notifyListeners();
  }

  @protected
  void nextRoundWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeValueText(),
        oldValue: value,
        newValue: ++value,
        type: type,
        production: 1,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    notifyListeners();
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

  TerraformingValue updateHistory(History history) {
    this.history = history;
    return this;
  }
}
