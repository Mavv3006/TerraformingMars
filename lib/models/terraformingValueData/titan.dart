import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Titan extends RessourceValue {
  Titan() : super("Titan");

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "Titan - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: Titan,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "Titan - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: Titan,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void nextRound() {
    super.nextRound();
    history.log(
      HistoryMessage(
        message: "Titan - next Round",
        oldValue: value - production,
        newValue: value,
        type: Titan,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
  }

  @override
  void decrementProduction() {
    super.decrementProduction();
    history.log(
      HistoryMessage(
        message: "Titan - decrement Production",
        oldValue: production + 1,
        newValue: production,
        type: Titan,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }

  @override
  void incrementProduction() {
    super.incrementProduction();
    history.log(
      HistoryMessage(
        message: "Titan - increment Production",
        oldValue: production - 1,
        newValue: production,
        type: Titan,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }
}
