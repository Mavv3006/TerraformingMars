import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Crop extends RessourceValue {
  Crop() : super("Pflanze");

  @override
  void nextRound() {
    nextRoundWithType(Crop);
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Crop);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Crop);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Crop);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Crop);
  }
}
