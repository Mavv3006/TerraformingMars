import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Steel extends RessourceValue {
  Steel() : super("Stahl");

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: "Steel - next Round",
        oldValue: value,
        newValue: value += production,
        type: Steel,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "Steel - decrement Value",
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: Steel,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "Steel - increment Value",
        oldValue: value,
        newValue: ++value,
        type: Steel,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }

  @override
  void decrementProduction() {
    history.log(
      HistoryMessage(
        message: "Steel - decrement Production",
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: Steel,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.decrementProduction();
  }

  @override
  void incrementProduction() {
    history.log(
      HistoryMessage(
        message: "Steel - increment Production",
        oldValue: production,
        newValue: ++production,
        type: Steel,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.incrementProduction();
  }
}
