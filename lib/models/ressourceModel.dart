import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:terraforming_mars/models/observer.dart';

class TerraformingModel with PropertyChangeNotifier<String> {
  String name;
  int value;

  incrementValue() {
    this.value++;
    notifyListeners("$name-Value");
  }

  decrementValue() {
    this.value--;
    notifyListeners("$name-Value");
  }

  TerraformingModel(this.name, {this.value = 20});
}

class RessouceModel extends TerraformingModel {
  int production;

  RessouceModel(name, {value = 0, this.production = 1}) : super(name) {
    this.value = value;
  }

  incrementProduction() {
    this.production++;
    notifyListeners("$name-Production");
  }

  decrementProduction() {
    this.production--;
    notifyListeners("$name-Production");
  }

  nextRound() {
    this.value += this.production;
    notifyListeners("$name-Value");
  }
}

class MegaCreditsModel extends RessouceModel {
  MegaCreditsModel(name, {value = 20, production = 1}) : super(name);

  @override
  nextRound() {
    this.value +=
        (this.production + RessourceDataModel.terraformingValue.value);
    notifyListeners("$name-Value");
  }
}

class RessourceDataModel {
  static final RessouceModel steel = new RessouceModel("Steel");
  static final RessouceModel energy = new RessouceModel("Energy");
  static final RessouceModel megaCredits = new MegaCreditsModel("MegaCredits");
  static final RessouceModel titan = new RessouceModel("Titan");
  static final RessouceModel plant = new RessouceModel("Plant");
  static final RessouceModel heat = new RessouceModel("Heat");
  static final TerraformingModel terraformingValue =
      new TerraformingModel("TerraformingValue");

  static final List<RessouceModel> _ressourceList = [
    megaCredits,
    steel,
    titan,
    plant,
    energy,
    heat
  ];

  static nextRound() {
    for (RessouceModel ressource in _ressourceList) {
      ressource.nextRound();
    }
    Observer.notifyObservers(Observer.nextRound);
  }
}
