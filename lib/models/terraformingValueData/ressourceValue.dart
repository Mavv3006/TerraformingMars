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

  void incrementProduction() {}

  @protected
  void incrementProductionWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeProductionText(),
        oldValue: production,
        newValue: ++production,
        type: type,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    notifyListeners();
  }

  void decrementProduction() {}

  @protected
  void decrementProductionWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeProductionText(),
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: type,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    notifyListeners();
  }

  @override
  void nextRoundWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: value,
        newValue: value += production,
        type: type,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    notifyListeners();
  }

  @override
  void decrementValue() {}

  @override
  void incrementValue() {}
}
