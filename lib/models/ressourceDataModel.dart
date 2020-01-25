import 'package:flutter/material.dart';

class RessourceDataModel extends ChangeNotifier {
  static final _terraformingDefaultValue = 20;
  static final _ressourceDefaultValue = 1;
  static final _megacreditDefaultValue = 20;

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

class TerraformingValue extends ChangeNotifier {
  TerraformingValue(this._title);

  final String _title;
  int _value = RessourceDataModel._terraformingDefaultValue;

  int get value => _value;

  bool get isValueGreaterThenZero => _value > 0;

  String get title => _title;

  String get valueToString => "${_value}";

  void resetValue() {
    _value = RessourceDataModel._terraformingDefaultValue;
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
    _value = RessourceDataModel._ressourceDefaultValue;
  }

  int _production = 1;

  bool get isProductionGreaterThenZero => _production > 0;

  int get production => _production;

  String get productionToString => "${_production}";

  @override
  void resetValue() {
    _value = RessourceDataModel._ressourceDefaultValue;
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

  Heat(this.energy) : super("Wärme");

  @override
  void nextRound() {
    _value += (energy._value + _production);
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
  }
}

class MegaCredits extends RessourceValue {
  Terraforming terraformingValue;

  MegaCredits(this.terraformingValue)
      : super.startBy(
            title: "Megacredits",
            startBy: RessourceDataModel._megacreditDefaultValue);

  @override
  void nextRound() {
    _value += (terraformingValue.value + _production);
  }

  @override
  void resetValue() {
    _value = RessourceDataModel._megacreditDefaultValue;
  }
}
