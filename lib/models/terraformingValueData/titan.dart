import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressource_value.dart';

class Titan extends RessourceValue with PlayCardMixin {
  Titan() : super('Titan');

  int _lastCardValue;

  @override
  int get lastCardValue => _lastCardValue;

  @override
  bool canPlayCard(int amount) {
    return dataModel.value >= amount;
  }

  @override
  void playAmount(int amount) {
    if (amount > 0) {
      _lastCardValue = (amount / setting.titanBuyValue).round();
      logPlayingCard();
    }
  }

  @override
  void playCard(int amount) {
    if (amount > 0) {
      _lastCardValue = amount;
      logPlayingCard();
    }
  }

  @override
  void logPlayingCard() {
    if (canPlayCard(_lastCardValue)) {
      history.log(
        HistoryMessage(
          message: 'Karte für $_lastCardValue Titan gekauft',
          oldValue: HistoryMessageValue(intValue: dataModel.value),
          newValue:
          HistoryMessageValue(intValue: dataModel.value -= _lastCardValue),
          type: Titan,
          historyMessageType: HistoryMessageType.action,
          actionType: ActionType.PLAY_CARDS_WITH_TITAN,
        ),
      );
      notifyListeners();
    } else {
      throw const ValueTooLowException('Du hast nicht genug Titan');
    }
  }

  @override
  void nextRound() {
    nextRoundWithType(Titan);
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Titan);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Titan);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Titan);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Titan);
  }

  @override
  Titan updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  Titan updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
