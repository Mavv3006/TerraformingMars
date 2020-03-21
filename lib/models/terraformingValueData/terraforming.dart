import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

class Terraforming extends TerraformingValue {
  Terraforming() : super("Terraforming Wert");

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: "${this.title}",
        oldValue: value,
        newValue: ++value,
        type: Terraforming,
        production: 1,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    notifyListeners();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: "${this.title}",
        oldValue: value,
        newValue: isValueGreaterThenZero ? --value : value,
        type: Terraforming,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    notifyListeners();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: "${this.title}",
        oldValue: value,
        newValue: ++value,
        type: Terraforming,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );
    notifyListeners();
  }

  @override
  Terraforming updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  Terraforming updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
