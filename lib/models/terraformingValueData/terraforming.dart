import 'package:terraforming_mars/exceptions/unequalValueException.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/data_model.dart';
import 'package:terraforming_mars/models/terraformingValueData/terraforming_value.dart';

class Terraforming extends TerraformingValue {
  Terraforming() : super('Terraforming Wert');

  final TerraformingDataModel dataModel = TerraformingDataModel();

  @override
  bool get isValueGreaterThenZero => dataModel.value > 0;

  @override
  String get valueToString => '${dataModel.value}';

  int get value => dataModel.value;

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: '$title',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(intValue: ++dataModel.value),
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
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue:
            isValueGreaterThenZero ? --dataModel.value : dataModel.value),
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
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(intValue: ++dataModel.value),
        type: Terraforming,
        historyMessageType: HistoryMessageType.value,
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

  @override
  void undo(HistoryMessage historyMessage) {
    if (historyMessage.historyMessageType == HistoryMessageType.value) {
      undoValue(historyMessage);
    }
  }

  @override
  void undoValue(HistoryMessage historyMessage) {
    if (historyMessage.newValue.intValue == dataModel.value) {
      dataModel.value = historyMessage.oldValue.intValue;
    } else {
      throw const UnequalValueException('HistoryMessage.newValue != value');
    }
  }
}
