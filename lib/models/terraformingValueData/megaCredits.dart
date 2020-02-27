import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

import '../defaultValue.dart';
import 'terraforming.dart';

class MegaCredits extends RessourceValue {
  Terraforming terraformingValue;

  MegaCredits()
      : super.startBy(
          title: "Megacredits",
          startBy: DefaultValue.defaultMegaCreditsStartValue,
        );

  @override
  void nextRound() {
    value += (terraformingValue.value + production);
    notifyListeners();
  }

  MegaCredits updateTerraformingValue(Terraforming value) {
    this.terraformingValue = value;
    return this;
  }
}
