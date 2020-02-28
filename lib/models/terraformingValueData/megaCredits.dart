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

  MegaCredits updateTerraformingValue(Terraforming value) {
    this.terraformingValue = value;
    return this;
  }

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: "MegaCredits - next Round",
        oldValue: value,
        newValue: value += (terraformingValue.value + production),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "MegaCredits - decrement Value",
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "MegaCredits - increment Value",
        oldValue: value,
        newValue: ++value,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }

  @override
  void decrementProduction() {
    history.log(
      HistoryMessage(
        message: "MegaCredits - decrement Production",
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.decrementProduction();
  }

  @override
  void incrementProduction() {
    history.log(
      HistoryMessage(
        message: "MegaCredits - increment Production",
        oldValue: production,
        newValue: ++production,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.incrementProduction();
  }
}
