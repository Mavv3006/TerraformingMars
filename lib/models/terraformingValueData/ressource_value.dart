import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/data_model.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraforming_value.dart';

import '../defaultValue.dart';

abstract class RessourceValue extends TerraformingValue {
  RessourceValue(String title) : super(title) {
    dataModel.value = DefaultRessourceValue.defaultValueValue;
  }

  RessourceValue.fromValue({@required int startBy, @required String title})
      : super(title) {
    dataModel.value = startBy;
  }

  final RessourceDataModel dataModel = RessourceDataModel();

  bool get isProductionGreaterThenZero => dataModel.production > 0;

  String get productionToString => '${dataModel.production}';

  @override
  bool get isValueGreaterThenZero => dataModel.value > 0;

  @override
  String get valueToString => '${dataModel.value}';

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
    if (historyMessage.newValue.intValue == dataModel.production) {
      dataModel.production = historyMessage.oldValue.intValue;
    } else {
      throw const UnequalValueException(
          'HistoryMessage.newValue != dataModel.value');
    }
  }

  void incrementProduction() {}

  @protected
  void incrementProductionWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeProductionText(),
        oldValue: HistoryMessageValue(intValue: dataModel.production),
        newValue: HistoryMessageValue(intValue: ++dataModel.production),
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
        oldValue: HistoryMessageValue(intValue: dataModel.production),
        newValue: HistoryMessageValue(
            intValue: isProductionGreaterThenZero
                ? --dataModel.production
                : dataModel.production),
        type: type,
        historyMessageType: HistoryMessageType.production,
      ),
    );
    notifyListeners();
  }

  void nextRoundWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue: dataModel.value += dataModel.production),
        production: dataModel.production,
        type: type,
        historyMessageType: HistoryMessageType.nextRound,
      ),
    );
    notifyListeners();
  }

  @override
  String toString() {
    return '$title{production: ${dataModel.production}, value: ${dataModel
        .value}}';
  }

  @protected
  void incrementValueWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessageValueText(),
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(intValue: ++dataModel.value),
        type: type,
        historyMessageType: HistoryMessageType.value,
      ),
    );
    notifyListeners();
  }

  @protected
  void decrementValueWithType(Type type) {
    history.log(
      HistoryMessage(
        message: getHistoryMessageValueText(),
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue:
            isValueGreaterThenZero ? --dataModel.value : dataModel.value),
        type: type,
        historyMessageType: HistoryMessageType.value,
      ),
    );
    notifyListeners();
  }

  @override
  void nextRound() {
    notifyListeners();
  }

  @override
  void undoValue(HistoryMessage historyMessage) {
    if (historyMessage.newValue.intValue == dataModel.value) {
      dataModel.value = historyMessage.oldValue.intValue;
    } else {
      throw const UnequalValueException('HistoryMessage.newValue != value');
    }
  }
}
