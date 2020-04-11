import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressource_value.dart';

class Steel extends RessourceValue with PlayCardMixin {
  Steel() : super('Stahl');

  int _lastCardValue;

  @override
  int get lastCardValue => _lastCardValue;

  @override
  bool canPlayCard(int amount) {
    return dataModel.value >= amount;
  }

  @override
  void playCard(int amount) {
    if (amount > 0) {
      _lastCardValue = (amount / setting.steelBuyValue).round();
      logPlayingCard();
    }
  }

  @override
  void playAmount(int amount) {
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
          message: 'Karte für $_lastCardValue Stahl gekauft',
          oldValue: HistoryMessageValue(intValue: dataModel.value),
          newValue:
          HistoryMessageValue(intValue: dataModel.value -= _lastCardValue),
          type: Steel,
          historyMessageType: HistoryMessageType.action,
          actionType: ActionType.PLAY_CARDS_WITH_STEEL,
        ),
      );
      notifyListeners();
    } else {
      throw const ValueTooLowException('Du hast nicht genug Stahl');
    }
  }

  @override
  void nextRound() {
    nextRoundWithType(Steel);
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Steel);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Steel);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Steel);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Steel);
  }

  @override
  Steel updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  Steel updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
