import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Energy extends RessourceValue {
  int _oldValue = 0;

  Energy() : super("Energie");

  @override
  void nextRound() {
    _oldValue = value;
    value = production;
    notifyListeners();
    history.log(
      HistoryMessage(
        message: "Energy - next Round",
        oldValue: _oldValue,
        newValue: value,
        type: Energy,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
  }

  int get oldValue => _oldValue;

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "Energy - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: Energy,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "Energy - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: Energy,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void decrementProduction() {
    super.decrementProduction();
    history.log(
      HistoryMessage(
        message: "Energy - decrement Production",
        oldValue: production + 1,
        newValue: production,
        type: Energy,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }

  @override
  void incrementProduction() {
    super.incrementProduction();
    history.log(
      HistoryMessage(
        message: "Energy - increment Production",
        oldValue: production - 1,
        newValue: production,
        type: Energy,
        historyMessageType: HistoryMessageType.PRODUCTION,
      ),
    );
  }
}
