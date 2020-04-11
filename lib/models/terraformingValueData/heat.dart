import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressource_value.dart';

import 'energy.dart';

class Heat extends RessourceValue with PlayCardMixin {
  Heat() : super('Wärme');

  Heat.withEnergy({@required this.energy}) : super('Wärme');

  Energy energy;

  Heat updateEnergy(Energy energy) {
    this.energy = energy;
    return this;
  }

  bool get isValueEnoughForTemperaturIncrease =>
      dataModel.value >= setting.heatTradeValue;

  int _lastCardValue;

  @override
  int get lastCardValue => _lastCardValue;

  void increaseTemperatur() {
    history.log(
      HistoryMessage(
        message: 'Temperatur erhöht',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue: dataModel.value -= setting.heatTradeValue),
        type: Heat,
        historyMessageType: HistoryMessageType.action,
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
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue: dataModel.value +=
                energy.oldValue + dataModel.production),
        type: Heat,
        production: energy.oldValue + dataModel.production,
        historyMessageType: HistoryMessageType.nextRound,
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

  @override
  void playCard(int amount) {
    playAmount(amount);
  }

  @override
  bool canPlayCard(int amount) {
    return dataModel.value >= amount;
  }

  @override
  void logPlayingCard() {
    if (canPlayCard(_lastCardValue)) {
      history.log(
        HistoryMessage(
          message: 'Karte für $_lastCardValue Wärme ausgespielt',
          oldValue: HistoryMessageValue(intValue: dataModel.value),
          newValue:
          HistoryMessageValue(intValue: dataModel.value -= _lastCardValue),
          type: Heat,
          historyMessageType: HistoryMessageType.action,
          actionType: ActionType.PLAY_CARDS_WITH_HEAT,
        ),
      );
      notifyListeners();
    } else {
      throw const ValueTooLowException('Du hast nicht genug Wärme');
    }
  }

  @override
  void playAmount(int amount) {
    if (amount > 0) {
      _lastCardValue = amount;
      logPlayingCard();
    }
  }
}
