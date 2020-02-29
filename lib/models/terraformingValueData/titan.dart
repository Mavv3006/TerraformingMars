import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Titan extends RessourceValue {
  Titan() : super("Titan");

  @override
  void nextRound() {
    nextRoundWithType(Titan);
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Titan);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Titan);
  }

  @override
  void decrementProduction() {
    super.decrementProductionWithType(Titan);
  }

  @override
  void incrementProduction() {
    super.incrementProductionWithType(Titan);
  }
}
