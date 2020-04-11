import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import '../defaultValue.dart';
import 'terraforming.dart';

class MegaCredits extends RessourceValue with PlayCardMixin {
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

  @override
  void playCards(int amount) {
    if (_isEnoughToPlayCards(amount)) {
      history.log(
        HistoryMessage(
          message: "Karte für $amount MC ausgespielt",
          oldValue: HistoryMessageValue(intValue: value),
          newValue: HistoryMessageValue(intValue: value -= amount),
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

  bool _isEnoughToPlayCards(int cardValue) {
    return this.value >= cardValue;
  }

  void buyCards(int amount) {
    if (_isEnoughToBuyCards(amount)) {
      history.log(
        HistoryMessage(
          message: "$amount Karten gekauft",
          oldValue: HistoryMessageValue(intValue: value),
          newValue: HistoryMessageValue(
            intValue: value -=
                (amount * DefaultActionValue.defaultCardBuyingValue),
          ),
          type: MegaCredits,
          historyMessageType: HistoryMessageType.ACTION,
          actionType: ActionType.BUY_CARDS,
        ),
      );
      notifyListeners();
    } else {
      throw ValueTooLowException("Du hast nicht genug MegaCredits");
    }
  }

  bool _isEnoughToBuyCards(int amount) {
    return this.value >= (amount * DefaultActionValue.defaultCardBuyingValue);
  }

  void sellCards(int amount) {
    history.log(
      HistoryMessage(
        message: "$amount Karten verkauft",
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
            intValue: value +=
                (amount * DefaultActionValue.defaultCardSellingValue)),
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
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
            intValue: value -=
                DefaultActionValue.defaultStandardProjectAsteroidValue),
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
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
            intValue: value -=
                DefaultActionValue.defaultStandardProjectOceanValue),
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
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
          intValue: value -=
              DefaultActionValue.defaultStandardProjectForestValue,
        ),
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
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
          intValue: value -= DefaultActionValue.defaultStandardProjectCityValue,
        ),
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
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
          intValue: value -=
              DefaultActionValue.defaultStandardProjectFactoryValue,
        ),
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
        oldValue: HistoryMessageValue(intValue: value),
        newValue: HistoryMessageValue(
          intValue: value += (terraformingValue.value + production),
        ),
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

  @override
  MegaCredits updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  MegaCredits updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }

  @override
  bool canPlayCards(int cardValue) {
    return _isEnoughToPlayCards(cardValue);
  }
}
