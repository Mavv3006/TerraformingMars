import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Steel extends RessourceValue {
  Steel() : super("Stahl");

  bool _isEnoughToByCards(int cardValueInSteel) {
    return this.value >= cardValueInSteel;
  }

  void playCards(int cardValue) {
    var cardValueInSteel = cardValue * setting.steelBuyValue;

    if (cardValue == 0) return;

    if (_isEnoughToByCards(cardValueInSteel)) {
      history.log(
        HistoryMessage(
          message: "Karte für $cardValueInSteel Stahl gekauft",
          oldValue: value,
          newValue: value -= cardValueInSteel,
          type: Steel,
          historyMessageType: HistoryMessageType.ACTION,
          actionType: ActionType.PLAY_CARDS_WITH_STEEL,
        ),
      );
      notifyListeners();
    } else {
      throw ValueTooLowException("Du hast nicht genug Stahl");
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
