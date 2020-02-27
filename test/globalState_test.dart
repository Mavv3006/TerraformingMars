import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('incrementing TerraformingValue', () {
    var terraformingValue = Terraforming();
    final startValue = terraformingValue.value;
    VoidCallback decrement = () {
      expect(terraformingValue.value, greaterThan(startValue));
    };
    terraformingValue.addListener(decrement);
    terraformingValue.incrementValue();
    terraformingValue.removeListener(decrement);
  });

  test('decrementing TerraformingValue', () {
    var terraformingValue = Terraforming();
    final startValue = terraformingValue.value;
    VoidCallback decrement = () {
      expect(terraformingValue.value, lessThan(startValue));
    };
    terraformingValue.addListener(decrement);
    terraformingValue.decrementValue();
    terraformingValue.removeListener(decrement);
  });

  test('nextRound greaterThem', () {
    var terraforming = Terraforming();
    var energy = Energy();
    var megacredits = MegaCredits().updateTerraformingValue(terraforming);
    var megaStartValue = megacredits.value;
    var energyStartValue = energy.value;
    var terraStartValue = terraforming.value;

    VoidCallback megaNextRound = () {
      expect(megacredits.value, greaterThan(megaStartValue));
    };
    VoidCallback energyNextRound = () {
      expect(energy.value, equals(energyStartValue));
    };
    VoidCallback terraNextRound = () {
      expect(terraforming.value, greaterThan(terraStartValue));
    };

    megacredits.addListener(megaNextRound);
    energy.addListener(energyNextRound);
    terraforming.addListener(terraNextRound);

    megacredits.nextRound();
    energy.nextRound();
    terraforming.nextRound();

    megacredits.removeListener(megaNextRound);
    energy.removeListener(energyNextRound);
    terraforming.removeListener(terraNextRound);
  });

  test('nextRound greaterThem', () {
    var terraforming = Terraforming();
    var energy = Energy();
    var megacredits = MegaCredits().updateTerraformingValue(terraforming);

    VoidCallback megaNextRound = () {
      expect(41, equals(megacredits.value));
    };
    VoidCallback energyNextRound = () {
      expect(1, equals(energy.value));
    };
    VoidCallback terraNextRound = () {
      expect(21, equals(terraforming.value));
    };

    megacredits.addListener(megaNextRound);
    energy.addListener(energyNextRound);
    terraforming.addListener(terraNextRound);

    megacredits.nextRound();
    energy.nextRound();
    terraforming.nextRound();

    megacredits.removeListener(megaNextRound);
    energy.removeListener(energyNextRound);
    terraforming.removeListener(terraNextRound);
  });
}
