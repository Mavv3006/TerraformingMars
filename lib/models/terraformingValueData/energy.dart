import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressource_value.dart';

class Energy extends RessourceValue {
  Energy() : super('Energie');

  int _oldValue = 0;

  int get oldValue => _oldValue;

  @override
  void nextRound() {
    _oldValue = dataModel.value;
    dataModel.value = dataModel.production;
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: HistoryMessageValue(intValue: _oldValue),
        newValue: HistoryMessageValue(intValue: dataModel.value),
        type: Energy,
        production: dataModel.value - _oldValue,
        historyMessageType: HistoryMessageType.nextRound,
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

  @override
  Energy updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  Energy updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
