import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Crop extends RessourceValue {
  Crop() : super("Pflanze");

  bool get isValueEnoughForForest =>
      value >= DefaultActionValue.defaultTerraformingActionForestValue;

  void buildForest() {
    history.log(
      HistoryMessage(
        message: null /*TODO: write message*/,
        oldValue: value,
        newValue: value -=
            DefaultActionValue.defaultTerraformingActionForestValue,
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
}
