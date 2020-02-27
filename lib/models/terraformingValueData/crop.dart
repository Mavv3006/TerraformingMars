import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Crop extends RessourceValue {
  Crop() : super("Pflanze");

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "Crop - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: Crop,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "Crop - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: Crop,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void nextRound() {
    super.nextRound();
    history.log(
      HistoryMessage(
        message: "Crop - next Round",
        oldValue: value - production,
        newValue: value,
        type: Crop,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
  }

  @override
  void decrementProduction() {
    super.decrementProduction();
    history.log(
      HistoryMessage(
        message: "Crop - decrement Production",
        oldValue: production + 1,
        newValue: production,
        type: Crop,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }

  @override
  void incrementProduction() {
    super.incrementProduction();
    history.log(
      HistoryMessage(
        message: "Crop - increment Production",
        oldValue: production - 1,
        newValue: production,
        type: Crop,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }
}
