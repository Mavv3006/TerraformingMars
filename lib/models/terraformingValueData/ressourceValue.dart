import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

import '../defaultValue.dart';

abstract class RessourceValue extends TerraformingValue {
  RessourceValue.startBy({@required int startBy, @required String title})
      : super(title) {
    value = value;
  }

  RessourceValue(String title) : super(title) {
    value = DefaultRessourceValue.defaultValueValue;
  }

  int production = DefaultRessourceValue.defaultProductionValue;

  bool get isProductionGreaterThenZero => production > 0;

  String get productionToString => "${production}";

  @override
  void undo(HistoryMessage historyMessage) {
    switch (historyMessage.historyMessageType) {
      case HistoryMessageType.VALUE:
      case HistoryMessageType.NEXT_ROUND:
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
      this.production = historyMessage.oldValue.intValue;
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
        oldValue: HistoryMessageValue(intValue:production),
        newValue: HistoryMessageValue(intValue:++production),
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
        oldValue: HistoryMessageValue(intValue:production),
        newValue: HistoryMessageValue(intValue:isProductionGreaterThenZero ? --production : production),
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
        oldValue: HistoryMessageValue(intValue:value),
        newValue: HistoryMessageValue(intValue:value += production),
        production: production,
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

  @override
  String toString() {
    return '$title{production: $production}, value: ${value}';
  }
}
