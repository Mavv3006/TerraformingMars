import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Steel extends RessourceValue {
  Steel() : super("Stahl");

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "Steel - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: Steel,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "Steel - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: Steel,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void nextRound() {
    super.nextRound();
    history.log(
      HistoryMessage(
        message: "Steel - next Round",
        oldValue: value - production,
        newValue: value,
        type: Steel,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
  }

  @override
  void decrementProduction() {
    super.decrementProduction();
    history.log(
      HistoryMessage(
        message: "Steel - decrement Production",
        oldValue: production + 1,
        newValue: production,
        type: Steel,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }

  @override
  void incrementProduction() {
    super.incrementProduction();
    history.log(
      HistoryMessage(
        message: "Steel - increment Production",
        oldValue: production - 1,
        newValue: production,
        type: Steel,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }
}
