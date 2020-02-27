import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import 'energy.dart';

class Heat extends RessourceValue {
  Energy energy;

  Heat() : super("Wärme");

  @override
  void nextRound() {
    value += (energy.oldValue + production);
    notifyListeners();
    history.log(
      HistoryMessage(
        message: "Heat - next Round",
        oldValue: value - (energy.oldValue + production),
        newValue: value,
        type: Heat,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
  }

  Heat updateEnergy(Energy energy) {
    this.energy = energy;
    return this;
  }

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "Heat - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: Heat,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "Heat - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: Heat,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void decrementProduction() {
    super.decrementProduction();
    history.log(
      HistoryMessage(
        message: "Heat - decrement Production",
        oldValue: production + 1,
        newValue: production,
        type: Heat,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }

  @override
  void incrementProduction() {
    super.incrementProduction();
    history.log(
      HistoryMessage(
        message: "Heat - increment Production",
        oldValue: production - 1,
        newValue: production,
        type: Heat,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }
}
