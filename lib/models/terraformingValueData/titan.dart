import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Titan extends RessourceValue {
  Titan() : super("Titan");

  bool _isEnoughToByCards(int amount) {
    return this.value >= amount;
  }

  void playCards(int amount) {
    if (amount == 0) return;

    if (_isEnoughToByCards(amount)) {
      history.log(
        HistoryMessage(
          message: "Karte für $amount Titan gekauft",
          oldValue: value,
          newValue: value -= amount,
          type: Titan,
          historyMessageType: HistoryMessageType.ACTION,
          actionType: ActionType.PLAY_CARDS_WITH_TITAN,
        ),
      );
      notifyListeners();
    } else {
      throw ValueTooLowException("Du hast nicht genug Titan");
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
