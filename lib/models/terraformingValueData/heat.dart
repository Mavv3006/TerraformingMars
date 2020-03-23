import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import 'energy.dart';

class Heat extends RessourceValue {
  Energy energy;

  Heat() : super("Wärme");

  Heat.withEnergy({@required this.energy}) : super("Wärme");

  Heat updateEnergy(Energy energy) {
    this.energy = energy;
    return this;
  }

  bool get isValueEnoughForTemperaturIncrease =>
      value >= setting.heatTradeValue;

  void increaseTemperatur() {
    history.log(
      HistoryMessage(
        message: "Temperatur erhöht",
        oldValue: value,
        newValue: value -= setting.heatTradeValue,
        type: Heat,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.INCREASE_TEMPERATUR,
      ),
    );
    notifyListeners();
  }

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: value,
        newValue: value += (energy.oldValue + production),
        type: Heat,
        production: energy.oldValue + production,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Heat);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Heat);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Heat);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Heat);
  }

  @override
  Heat updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  Heat updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
