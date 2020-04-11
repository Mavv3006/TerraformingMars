import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Crop extends RessourceValue {
  Crop() : super("Pflanze");

  bool get isValueEnoughForForest => value >= setting.cropTradeValue;

  void buildForest() {
    history.log(
      HistoryMessage(
        message: "Wald gepflanzt",
        oldValue: HistoryMessageValue(intValue: value),
        newValue:
            HistoryMessageValue(intValue: value -= setting.cropTradeValue),
        type: Crop,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.BUILD_FOREST_WITH_CROP,
      ),
    );
    notifyListeners();
  }

  @override
  void nextRound() {
    nextRoundWithType(Crop);
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Crop);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Crop);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Crop);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Crop);
  }

  @override
  Crop updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  Crop updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
