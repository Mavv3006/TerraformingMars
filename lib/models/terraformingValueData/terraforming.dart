import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';

import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

class Terraforming extends TerraformingValue {
  Terraforming() : super('Terraforming Wert');

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: '$title',
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(intValue: ++value),
        type: Terraforming,
        production: 1,
        historyMessageType: HistoryMessageType.value,
      ),
    );
    notifyListeners();
  }

  @override
  void decrementValue() {
    history.log(
      HistoryMessage(
        message: '$title',
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
            intValue: isValueGreaterThenZero ? --value : value),
        type: Terraforming,
        historyMessageType: HistoryMessageType.value,
      ),
    );
    notifyListeners();
  }

  @override
  void incrementValue() {
    history.log(
      HistoryMessage(
        message: '$title',
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(intValue: ++value),
        type: Terraforming,
        historyMessageType: HistoryMessageType.value,
      ),
    );
    notifyListeners();
  }

  @override
  Terraforming updateHistory(History history) {
    history = history;
    return this;
  }

  @override
  Terraforming updateSetting(SettingsModel setting) {
    setting = setting;
    return this;
  }
}
