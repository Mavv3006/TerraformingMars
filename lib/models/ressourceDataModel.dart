import 'package:scoped_model/scoped_model.dart';

class RessourceDataModel extends Model {
  final terraFormingValue = new TerraformingValue("Terraforming Wert");
  final megaCredits =
      new RessourceValue.startBy(title: "Megacredits", startBy: 20);
  final titan = new RessourceValue("Titan");
  final heat = new RessourceValue("Wärme");
  final crop = new RessourceValue("Pflanze");
  final energy = new RessourceValue("Energie");
  final steel = new RessourceValue("Stahl");
}

class TerraformingValue {
  TerraformingValue(this._title);

  final String _title;
  int _value = 20;

  int get value => _value;

  String get title => _title;

  String get valueToString => "${_value}";

  incrementValue() {
    _value++;
  }

  decrementValue() {
    _value--;
  }
}

class RessourceValue extends TerraformingValue {
  RessourceValue.startBy({int startBy, String title}) : super(title) {
    _value = value;
  }

  RessourceValue(String title) : super(title) {
    _value = 0;
  }

  int _production = 1;

  int get production => _production;
  String get productionToString => "${_production}";

  incrementProduction() {
    _production++;
  }

  decrementProduction() {
    _production--;
  }
}
