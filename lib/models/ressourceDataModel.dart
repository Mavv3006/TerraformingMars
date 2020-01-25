import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';

class RessourceDataModel extends ChangeNotifier {
  static final terraformingDefaultValue = 20;
  static final ressourceDefaultValue = 1;
  static final megacreditDefaultValue = 20;

  static final terraFormingValue = new Terraforming();
  static final energy = new Energy();

  RessourceDataModel() {
    _resetValue();
  }

  void nextRound() {
    terraFormingValue.nextRound();
    energy.nextRound();
    notifyListeners();
  }

  void _resetValue() {
    terraFormingValue.resetValue();
    energy.resetValue();
  }

  void incrementTerraformingValue() {
    terraFormingValue.incrementValue();
    notifyListeners();
  }

  void decrementTerraformingValue() {
    terraFormingValue.decrementValue();
    notifyListeners();
  }

  void incrementEnergyValue() {
    energy.incrementValue();
    notifyListeners();
  }

  void decrementEnergyValue() {
    energy.decrementValue();
    notifyListeners();
  }

  void incrementEnergyProduction() {
    energy.incrementProduction();
    notifyListeners();
  }

  void decrementEnergyProduction() {
    energy.decrementProduction();
    notifyListeners();
  }

  bool get isTerraformingValueGreaterThenZero =>
      terraFormingValue.isValueGreaterThenZero;

  bool get isEnergyValueGreaterThenZero => energy.isValueGreaterThenZero;

  bool get isEnergyProductionGreaterThenZero =>
      energy.isProductionGreaterThenZero;
}