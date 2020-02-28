import 'package:flutter/cupertino.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import 'energy.dart';

class Heat extends RessourceValue {
  Energy energy;

  Heat() : super("Wärme");

  Heat.withEnergy({@required this.energy}) : super("Wärme");

  Heat updateEnergy(Energy energy) {
    this.energy = energy;
    return this;
  }

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: "Heat - next Round",
        oldValue: value,
        newValue: value += (energy.oldValue + production),
        type: Heat,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }


  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "Heat - decrement Value",
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: Heat,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "Heat - increment Value",
        oldValue: value,
        newValue: ++value,
        type: Heat,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }

  @override
  void decrementProduction() {
    history.log(
      HistoryMessage(
        message: "Heat - decrement Production",
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: Heat,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.decrementProduction();
  }

  @override
  void incrementProduction() {
    history.log(
      HistoryMessage(
        message: "Heat - increment Production",
        oldValue: production,
        newValue: ++production,
        type: Heat,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.incrementProduction();
  }
}
