import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

import '../defaultValue.dart';

abstract class RessourceValue extends TerraformingValue {
  RessourceValue(String title) : super(title) {
    value = DefaultRessourceValue.defaultValueValue;
  }

  RessourceValue.fromValue({@required int startBy, @required String title})
      : super(title) {
    value = startBy;
  }

  int production = DefaultRessourceValue.defaultProductionValue;

  bool get isProductionGreaterThenZero => production > 0;

  String get productionToString => '$production';

  @override
  void undo(HistoryMessage historyMessage) {
    switch (historyMessage.historyMessageType) {
      case HistoryMessageType.value:
      case HistoryMessageType.nextRound:
      case HistoryMessageType.action:
        undoValue(historyMessage);
        return;
      case HistoryMessageType.production:
        undoProduction(historyMessage);
        return;
      case HistoryMessageType.setting:
        print('HistoryMessageType.SETTING detectet in RessourceValue');
        break;
    }
  }

  void undoProduction(HistoryMessage historyMessage) {
    if (historyMessage.newValue.intValue == production) {
      production = historyMessage.oldValue.intValue;
    } else {
      throw const UnequalValueException('HistoryMessage.newValue != this.value');
    }
  }

  void incrementProduction() {}

  @protected
  void incrementProductionWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeProductionText(),
        oldValue: HistoryMessageValue(intValue: production),
        newValue: HistoryMessageValue(intValue: ++production),
        type: type,
        historyMessageType: HistoryMessageType.production,
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
        oldValue: HistoryMessageValue(intValue: production),
        newValue: HistoryMessageValue(
            intValue: isProductionGreaterThenZero ? --production : production),
        type: type,
        historyMessageType: HistoryMessageType.production,
      ),
    );
    notifyListeners();
  }

  @override
  void nextRoundWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(intValue: value += production),
        production: production,
        type: type,
        historyMessageType: HistoryMessageType.nextRound,
      ),
    );
    notifyListeners();
  }

  @override
  String toString() {
    return '$title{production: $production}, value: $value';
  }
}
