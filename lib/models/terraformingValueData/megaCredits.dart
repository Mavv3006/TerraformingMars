import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import '../defaultValue.dart';
import 'terraforming.dart';

class MegaCredits extends RessourceValue {
  Terraforming terraformingValue;

  MegaCredits()
      : super.startBy(
          title: "Megacredits",
          startBy: DefaultValue.defaultMegaCreditsStartValue,
        );

  @override
  void nextRound() {
    value += (terraformingValue.value + production);
    notifyListeners();
    history.log(
      HistoryMessage(
        message: "MegaCredits - next Round",
        oldValue: value - (terraformingValue.value + production),
        newValue: value,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
  }

  MegaCredits updateTerraformingValue(Terraforming value) {
    this.terraformingValue = value;
    return this;
  }

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "MegaCredits - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "MegaCredits - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void decrementProduction() {
    super.decrementProduction();
    history.log(
      HistoryMessage(
        message: "MegaCredits - decrement Production",
        oldValue: production + 1,
        newValue: production,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }

  @override
  void incrementProduction() {
    super.incrementProduction();
    history.log(
      HistoryMessage(
        message: "MegaCredits - increment Production",
        oldValue: production - 1,
        newValue: production,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }
}
