import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';

class TerraformingValue extends ChangeNotifier {
  TerraformingValue(this._title);

  final String _title;
  int _value = RessourceDataModel.terraformingDefaultValue;

  int get value => _value;

  bool get isValueGreaterThenZero => _value > 0;

  String get title => _title;

  String get valueToString => "${_value}";

  void resetValue() {
    _value = RessourceDataModel.terraformingDefaultValue;
  }

  void incrementValue() {
    _value++;
    notifyListeners();
  }

  void decrementValue() {
    if (isValueGreaterThenZero) _value--;
    notifyListeners();
  }

  void nextRound() {
    incrementValue();
  }
}

class RessourceValue extends TerraformingValue {
  RessourceValue.startBy({@required int startBy, @required String title})
      : super(title) {
    _value = value;
  }

  RessourceValue(String title) : super(title) {
    _value = RessourceDataModel.ressourceDefaultValue;
  }

  int _production = 1;

  bool get isProductionGreaterThenZero => _production > 0;

  int get production => _production;

  String get productionToString => "${_production}";

  @override
  void resetValue() {
    _value = RessourceDataModel.ressourceDefaultValue;
  }

  void incrementProduction() {
    _production++;
    notifyListeners();
  }

  void decrementProduction() {
    if (isProductionGreaterThenZero) _production--;
    notifyListeners();
  }

  @override
  void nextRound() {
    _value += _production;
    notifyListeners();
  }
}

class Terraforming extends TerraformingValue {
  Terraforming() : super("Terraforming Wert");
}

class Steel extends RessourceValue {
  Steel() : super("Stahl");
}

class Heat extends RessourceValue {
  RessourceValue energy;

  Heat copy() => this;

  Heat(this.energy) : super("Wärme");

  @override
  void nextRound() {
    _value += (energy._value + _production);
    notifyListeners();
  }
}

class Titan extends RessourceValue {
  Titan() : super("Titan");
}

class Crop extends RessourceValue {
  Crop() : super("Pflanze");
}

class Energy extends RessourceValue {
  Energy() : super("Energie");

  @override
  void nextRound() {
    _value = _production;
    notifyListeners();
  }
}

class MegaCredits extends RessourceValue {
  Terraforming terraformingValue;

  MegaCredits(this.terraformingValue)
      : super.startBy(
            title: "Megacredits",
            startBy: RessourceDataModel.megacreditDefaultValue);

  @override
  void nextRound() {
    _value += (terraformingValue.value + _production);
    notifyListeners();
  }

  @override
  void resetValue() {
    _value = RessourceDataModel.megacreditDefaultValue;
  }
}
