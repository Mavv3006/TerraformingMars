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
    super.decrementValueWithType(MegaCredits);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(MegaCredits);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(MegaCredits);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(MegaCredits);
  }
}
