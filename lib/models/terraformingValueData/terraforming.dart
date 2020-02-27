import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

class Terraforming extends TerraformingValue {
  Terraforming() : super("Terraforming Wert");

  @override
  void decrementValue() {
    super.decrementValue();
    history.log(
      HistoryMessage(
        message: "Terraforming - decrement Value",
        oldValue: value + 1,
        newValue: value,
        type: Terraforming,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }

  @override
  void incrementValue() {
    super.incrementValue();
    history.log(
      HistoryMessage(
        message: "Terraforming - increment Value",
        oldValue: value - 1,
        newValue: value,
        type: Terraforming,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
  }
}
