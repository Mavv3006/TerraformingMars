import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('incrementing TerraformingValue', () {
    var terraformingValue = Terraforming();
    terraformingValue.history = History();
    final startValue = terraformingValue.value;
    VoidCallback incrementCallback = () {
      expect(terraformingValue.value, greaterThan(startValue));
    };
    terraformingValue.addListener(incrementCallback);
    terraformingValue.incrementValue();
    terraformingValue.removeListener(incrementCallback);
  });

  test('decrementing TerraformingValue', () {
    var terraformingValue = Terraforming();
    terraformingValue.history = History();
    final startValue = terraformingValue.value;
    VoidCallback decrementCallback = () {
      expect(terraformingValue.value, lessThan(startValue));
    };
    terraformingValue.addListener(decrementCallback);
    terraformingValue.decrementValue();
    terraformingValue.removeListener(decrementCallback);
  });

  test('nextRound greaterThem', () {
    var history = History();
    var terraforming = Terraforming();
    var energy = Energy();
    var megacredits = MegaCredits().updateTerraformingValue(terraforming);

    terraforming.history = history;
    energy.history = history;
    megacredits.history = history;

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
    var history = History();
    var terraforming = Terraforming();
    var energy = Energy();
    var megacredits = MegaCredits().updateTerraformingValue(terraforming);

    terraforming.history = history;
    energy.history = history;
    megacredits.history = history;

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
