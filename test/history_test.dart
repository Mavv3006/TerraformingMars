import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test("adding Messages", () {
    var history = History();
    var energy = Energy();
    int startValue = energy.value;
    energy.incrementValue();
    int newValue = energy.value;

    history.log(HistoryMessage(
      oldValue: startValue,
      newValue: newValue,
      message: "Increment Energy Value",
      historyMessageType: HistoryMessageType.VALUE,
      type: Energy,
    ));

    expect(1, equals(history.length()));
    expect("Increment Energy Value", equals(history.getLastEntry().message));
    expect(0, equals(history.length()));
  });
}
