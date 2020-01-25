import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';

void main() {
  test('incrementing TerraformingValue', () {
    RessourceDataModel.terraFormingValue.resetValue();
    final startValue = RessourceDataModel.terraFormingValue.value;
    VoidCallback increment = () {
      expect(
          RessourceDataModel.terraFormingValue.value, greaterThan(startValue));
    };
    RessourceDataModel.terraFormingValue.addListener(increment);
    RessourceDataModel.terraFormingValue.incrementValue();
    RessourceDataModel.terraFormingValue.removeListener(increment);
  });

  test('decrementing TerraformingValue', () {
    RessourceDataModel.terraFormingValue.resetValue();
    final startValue = RessourceDataModel.terraFormingValue.value;
    VoidCallback decrement = () {
      expect(RessourceDataModel.terraFormingValue.value, lessThan(startValue));
    };
    RessourceDataModel.terraFormingValue.addListener(decrement);
    RessourceDataModel.terraFormingValue.decrementValue();
    RessourceDataModel.terraFormingValue.removeListener(decrement);
  });

  test('nextRound greaterThem', () {
    var terraforming = Terraforming();
    var energy = Energy();
    var megacredits = MegaCredits(terraforming);
    var megaStartValue = megacredits.value;
    var energyStartValue = RessourceDataModel.energy.value;
    var terraStartValue = RessourceDataModel.terraFormingValue.value;

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
    var megacredits = MegaCredits(terraforming);

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
