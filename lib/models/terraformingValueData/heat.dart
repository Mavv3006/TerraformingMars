import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import 'energy.dart';

class Heat extends RessourceValue {
  Energy energy;

  Heat() : super("Wärme");

  @override
  void nextRound() {
    value += (energy.oldValue + production);
    notifyListeners();
  }

  Heat updateEnergy(Energy energy) {
    this.energy = energy;
    return this;
  }
}
