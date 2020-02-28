import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Titan extends RessourceValue {
  Titan() : super("Titan");

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: "Titan - next Round",
        oldValue: value,
        newValue: value += production,
        type: Titan,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "Titan - decrement Value",
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: Titan,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "Titan - increment Value",
        oldValue: value,
        newValue: ++value,
        type: Titan,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }

  @override
  void decrementProduction() {
    history.log(
      HistoryMessage(
        message: "Titan - decrement Production",
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: Titan,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.decrementProduction();
  }

  @override
  void incrementProduction() {
    history.log(
      HistoryMessage(
        message: "Titan - increment Production",
        oldValue: production,
        newValue: ++production,
        type: Titan,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.incrementProduction();
  }
}
