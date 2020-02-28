import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

import '../defaultValue.dart';

class RessourceValue extends TerraformingValue {
  RessourceValue.startBy({@required int startBy, @required String title})
      : super(title) {
    value = value;
  }

  RessourceValue(String title) : super(title) {
    value = DefaultValue.defaultValueValue;
  }

  int production = DefaultValue.defaultProductionValue;

  bool get isProductionGreaterThenZero => production > 0;

  String get productionToString => "${production}";

  @override
  void undo(HistoryMessage historyMessage) {
    switch (historyMessage.historyMessageType) {
      case HistoryMessageType.VALUE:
        undoValue(historyMessage);
        return;
      case HistoryMessageType.PRODUCTION:
        undoProduction(historyMessage);
        return;
      default:
        return;
    }
  }

  void undoProduction(HistoryMessage historyMessage) {
    if (historyMessage.newValue == this.production) {
      this.production = historyMessage.oldValue;
    } else {
      throw UnequalValueException("HistoryMessage.newValue != this.value");
    }
  }

  void incrementProduction() {
    notifyListeners();
  }

  void decrementProduction() {
    notifyListeners();
  }

  @override
  void nextRound() {
    notifyListeners();
  }
}
