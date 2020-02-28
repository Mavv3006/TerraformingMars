import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Crop extends RessourceValue {
  Crop() : super("Pflanze");

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: "Crop - next Round",
        oldValue: value,
        newValue: value += production,
        type: Crop,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "Crop - decrement Value",
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: Crop,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "Crop - increment Value",
        oldValue: value,
        newValue: ++value,
        type: Crop,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }

  @override
  void decrementProduction() {
    history.log(
      HistoryMessage(
        message: "Crop - decrement Production",
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: Crop,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.decrementProduction();
  }

  @override
  void incrementProduction() {
    history.log(
      HistoryMessage(
        message: "Crop - increment Production",
        oldValue: production,
        newValue: ++production,
        type: Crop,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.incrementProduction();
  }
}
