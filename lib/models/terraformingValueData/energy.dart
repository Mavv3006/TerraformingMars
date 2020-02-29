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
        message: getHistoryMessgeNextRoundText(),
        oldValue: _oldValue,
        newValue: value,
        type: Energy,
        production: value - _oldValue,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Energy);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Energy);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Energy);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Energy);
  }
}
