import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';

import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Titan extends RessourceValue with PlayCardMixin {
  Titan() : super('Titan');

  @override
  bool canPlayCards(int cardValue) {
    return value >= cardValue;
  }

  @override
  void playCards(int amount) {
    if (amount == 0) {
      return;
    }

    if (canPlayCards(amount)) {
      history.log(
        HistoryMessage(
          message: 'Karte für $amount Titan gekauft',
          oldValue: HistoryMessageValue(intValue: value),
          newValue: HistoryMessageValue(intValue: value -= amount),
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
