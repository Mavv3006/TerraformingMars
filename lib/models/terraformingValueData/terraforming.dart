import 'package:terraforming_mars/models/terraformingValueData/terraformingValue.dart';

class Terraforming extends TerraformingValue {
  Terraforming() : super("Terraforming Wert");

  @override
  void nextRound() {
    nextRoundWithType(Terraforming);
  }

  @override
  void decrementValue() {
    super.decrementValueWithType(Terraforming);
  }

  @override
  void incrementValue() {
    super.incrementValueWithType(Terraforming);
  }
}
