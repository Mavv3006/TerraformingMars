import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Steel extends RessourceValue with PlayCardMixin {
  Steel() : super('Stahl');

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
          message: 'Karte für $amount Stahl gekauft',
          oldValue: HistoryMessageValue(intValue: value),
          newValue: HistoryMessageValue(intValue: value -= amount),
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
    history = history;
    return this;
  }

  @override
  Steel updateSetting(SettingsModel setting) {
    setting = setting;
    return this;
  }
}
