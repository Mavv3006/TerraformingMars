import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/mixins/play_card_mixin.dart';
import 'package:terraforming_mars/models/terraformingValueData/ressource_value.dart';

import '../defaultValue.dart';
import 'terraforming.dart';

class MegaCredits extends RessourceValue with PlayCardMixin {
  MegaCredits()
      : super.fromValue(
          title: 'Megacredits',
          startBy: DefaultRessourceValue.defaultMegaCreditsStartValue,
        );

  Terraforming terraformingValue;

  bool get isValueEnoughForFactory =>
      dataModel.value >= DefaultActionValue.defaultStandardProjectFactoryValue;

  bool get isValueEnoughForAsteroid =>
      dataModel.value >= DefaultActionValue.defaultStandardProjectAsteroidValue;

  bool get isValueEnoughForOcean =>
      dataModel.value >= DefaultActionValue.defaultStandardProjectOceanValue;

  bool get isValueEnoughForForest =>
      dataModel.value >= DefaultActionValue.defaultStandardProjectForestValue;

  bool get isValueEnoughForCity =>
      dataModel.value >= DefaultActionValue.defaultStandardProjectCityValue;

  MegaCredits updateTerraformingValue(Terraforming value) {
    terraformingValue = value;
    return this;
  }

  @override
  bool canPlayCard(int amount) {
    return dataModel.value >= amount;
  }

  @override
  void playCard(int amount) {
    playAmount(amount);
  }

  @override
  void playAmount(int amount) {
    if (amount > 0) {
      _lastCardValue = amount;
      logPlayingCard();
    }
  }

  @override
  void logPlayingCard() {
    if (canPlayCard(_lastCardValue)) {
      history.log(
        HistoryMessage(
          message: 'Karte für $_lastCardValue MC ausgespielt',
          oldValue: HistoryMessageValue(intValue: dataModel.value),
          newValue:
          HistoryMessageValue(intValue: dataModel.value -= _lastCardValue),
          type: MegaCredits,
          historyMessageType: HistoryMessageType.action,
          actionType: ActionType.PLAY_CARDS_WITH_MC,
        ),
      );
      notifyListeners();
    } else {
      throw const ValueTooLowException('Du hast nicht genug MegaCredits');
    }
  }

  void buyCards(int amount) {
    if (_isEnoughToBuyCards(amount)) {
      history.log(
        HistoryMessage(
          message: '$amount Karten gekauft',
          oldValue: HistoryMessageValue(intValue: dataModel.value),
          newValue: HistoryMessageValue(
            intValue: dataModel.value -=
                amount * DefaultActionValue.defaultCardBuyingValue,
          ),
          type: MegaCredits,
          historyMessageType: HistoryMessageType.action,
          actionType: ActionType.BUY_CARDS,
        ),
      );
      notifyListeners();
    } else {
      throw const ValueTooLowException('Du hast nicht genug MegaCredits');
    }
  }

  bool _isEnoughToBuyCards(int amount) {
    return dataModel.value >=
        (amount * DefaultActionValue.defaultCardBuyingValue);
  }

  int _lastCardValue;

  @override
  int get lastCardValue => _lastCardValue;

  void sellCards(int amount) {
    history.log(
      HistoryMessage(
        message: '$amount Karten verkauft',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
          intValue: dataModel.value +=
              amount * DefaultActionValue.defaultCardSellingValue,
        ),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.action,
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
        message: 'Asteroid abgeschleppt',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue: dataModel.value -=
                DefaultActionValue.defaultStandardProjectAsteroidValue),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.action,
        actionType: ActionType.ASTEROID,
      ),
    );
  }

  void _logActionTypeOcean() {
    history.log(
      HistoryMessage(
        message: 'Ozean bewässert',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
            intValue: dataModel.value -=
                DefaultActionValue.defaultStandardProjectOceanValue),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.action,
        actionType: ActionType.BUILD_OCEAN,
      ),
    );
  }

  void _logActionTypeForest() {
    history.log(
      HistoryMessage(
        message: 'Wald gepflanzt',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
          intValue: dataModel.value -=
              DefaultActionValue.defaultStandardProjectForestValue,
        ),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.action,
        actionType: ActionType.BUILD_FOREST_WITH_MC,
      ),
    );
  }

  void _logActionTypeCity() {
    history.log(
      HistoryMessage(
        message: 'Stadt gebaut',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
          intValue: dataModel.value -=
              DefaultActionValue.defaultStandardProjectCityValue,
        ),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.action,
        actionType: ActionType.BUILD_CITY,
      ),
    );
  }

  void _logActionTypeFactory() {
    history.log(
      HistoryMessage(
        message: 'Kraftwerk errichtet',
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
          intValue: dataModel.value -=
              DefaultActionValue.defaultStandardProjectFactoryValue,
        ),
        type: MegaCredits,
        historyMessageType: HistoryMessageType.action,
        actionType: ActionType.BUILD_FACTORY,
      ),
    );
  }

  @override
  void nextRound() {
    history.log(
      HistoryMessage(
        message: getHistoryMessgeNextRoundText(),
        oldValue: HistoryMessageValue(intValue: dataModel.value),
        newValue: HistoryMessageValue(
          intValue: dataModel.value +=
              terraformingValue.value + dataModel.production,
        ),
        type: MegaCredits,
        production: terraformingValue.value + dataModel.production,
        historyMessageType: HistoryMessageType.nextRound,
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
  MegaCredits updateHistory(History history) {
    this.history = history;
    return this;
  }

  @override
  MegaCredits updateSetting(SettingsModel setting) {
    this.setting = setting;
    return this;
  }
}
