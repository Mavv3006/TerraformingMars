import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import '../defaultValue.dart';
import 'terraforming.dart';

class MegaCredits extends RessourceValue {
  Terraforming terraformingValue;

  bool get isValueEnoughForFactory =>
      value >= DefaultActionValue.defaultStandardProjectFactoryValue;

  bool get isValueEnoughForAsteroid =>
      value >= DefaultActionValue.defaultStandardProjectAsteroidValue;

  bool get isValueEnoughForOcean =>
      value >= DefaultActionValue.defaultStandardProjectOceanValue;

  bool get isValueEnoughForForest =>
      value >= DefaultActionValue.defaultStandardProjectForestValue;

  bool get isValueEnoughForCity =>
      value >= DefaultActionValue.defaultStandardProjectCityValue;

  MegaCredits()
      : super.startBy(
          title: "Megacredits",
          startBy: DefaultRessourceValue.defaultMegaCreditsStartValue,
        );

  MegaCredits updateTerraformingValue(Terraforming value) {
    this.terraformingValue = value;
    return this;
  }

  bool _isEnoughToByCards(int amount) {
    return this.value >= amount;
  }

  void buyCards(int amount) {
    if (amount == 0) return;

    if (_isEnoughToByCards(amount)) {
      history.log(
        HistoryMessage(
          message: "Karte für $amount MC gekauft",
          oldValue: value,
          newValue: value -= amount,
          type: MegaCredits,
          historyMessageType: HistoryMessageType.ACTION,
          actionType: ActionType.PLAY_CARDS_WITH_MC,
        ),
      );
      notifyListeners();
    } else {
      throw ValueTooLowException("Du hast nicht genug MegaCredits");
    }
  }

  void sellCards(int amount) {
    history.log(
      HistoryMessage(
        message: "$amount Karten verkauft",
        oldValue: value,
        newValue: value +=
            (amount * DefaultActionValue.defaultCardSellingValue),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.SELL_CARDS,
      ),
    );
    notifyListeners();
  }

  void standardProject(ActionType actionType) {
    switch (actionType) {
      case ActionType.BUILD_FACTORY:
        _logActionTypeFactory();
        break;
      case ActionType.BUILD_CITY:
        _logActionTypeCity();
        break;
      case ActionType.BUILD_FOREST_WITH_MC:
        _logActionTypeForest();
        break;
      case ActionType.BUILD_OCEAN:
        _logActionTypeOcean();
        break;
      case ActionType.ASTEROID:
        _logActionTypeAsteroid();
        break;
      default:
        break;
    }
    notifyListeners();
  }

  void _logActionTypeAsteroid() {
    history.log(
      HistoryMessage(
        message: "Asteroid abgeschleppt",
        oldValue: value,
        newValue: value -=
            DefaultActionValue.defaultStandardProjectAsteroidValue,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.ASTEROID,
      ),
    );
  }

  void _logActionTypeOcean() {
    history.log(
      HistoryMessage(
        message: "Ozean bewässert",
        oldValue: value,
        newValue: value -= DefaultActionValue.defaultStandardProjectOceanValue,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.BUILD_OCEAN,
      ),
    );
  }

  void _logActionTypeForest() {
    history.log(
      HistoryMessage(
        message: "Wald gepflanzt",
        oldValue: value,
        newValue: value -= DefaultActionValue.defaultStandardProjectForestValue,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.BUILD_FOREST_WITH_MC,
      ),
    );
  }

  void _logActionTypeCity() {
    history.log(
      HistoryMessage(
        message: "Stadt gebaut",
        oldValue: value,
        newValue: value -= DefaultActionValue.defaultStandardProjectCityValue,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.BUILD_CITY,
      ),
    );
  }

  void _logActionTypeFactory() {
    history.log(
      HistoryMessage(
        message: "Kraftwerk errichtet",
        oldValue: value,
        newValue: value -=
            DefaultActionValue.defaultStandardProjectFactoryValue,
        type: MegaCredits,
        historyMessageType: HistoryMessageType.ACTION,
        actionType: ActionType.BUILD_FACTORY,
      ),
    );
  }

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: value,
        newValue: value += (terraformingValue.value + production),
        type: MegaCredits,
        production: terraformingValue.value + production,
        historyMessageType: HistoryMessageType.NEXT_ROUND,
      ),
    );
    super.nextRound();
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(MegaCredits);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(MegaCredits);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(MegaCredits);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(MegaCredits);
  }

  @override
  String toString() {
    return super.toString();
  }
}
