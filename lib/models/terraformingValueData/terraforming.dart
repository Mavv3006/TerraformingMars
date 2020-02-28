import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

class Terraforming extends TerraformingValue {
  Terraforming() : super("Terraforming Wert");

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "Terraforming - decrement Value",
        oldValue: value,
        newValue: isValueGreaterThenZero ? --value : value,
        type: Terraforming,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.decrementValue();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "Terraforming - increment Value",
        oldValue: value,
        newValue: ++value,
        type: Terraforming,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    super.incrementValue();
  }
}
