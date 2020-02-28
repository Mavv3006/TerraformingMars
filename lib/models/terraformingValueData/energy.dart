import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Energy extends RessourceValue {
  int _oldValue = 0;

  int get oldValue => _oldValue;

  Energy() : super("Energie");

  @override
  void nextRound() {
    _oldValue = value;
    value = production;
    history.log(
      HistoryMessage(
        message: "Energy - next Round",
        oldValue: _oldValue,
        newValue: value,
        type: Energy,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "Energy - decrement Value",
        newValue: value,
        oldValue: isValueGreaterThenZero ? --value : value,
        type: Energy,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "Energy - increment Value",
        oldValue: value,
        newValue: ++value,
        type: Energy,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }

  @override
  void decrementProduction() {
    history.log(
      HistoryMessage(
        message: "Energy - decrement Production",
        oldValue: production,
        newValue: isProductionGreaterThenZero ? --production : production,
        type: Energy,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.decrementProduction();
  }

  @override
  void incrementProduction() {
    history.log(
      HistoryMessage(
        message: "Energy - increment Production",
        oldValue: production,
        newValue: ++production,
        type: Energy,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
    super.incrementProduction();
  }
}
