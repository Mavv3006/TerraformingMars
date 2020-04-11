import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('incrementing TerraformingValue', () {
    final Terraforming terraformingValue = Terraforming();
    terraformingValue.history = History();
    final int startValue = terraformingValue.value;
    final VoidCallback incrementCallback = () {
      expect(terraformingValue.value, greaterThan(startValue));
    };
    terraformingValue.addListener(incrementCallback);
    terraformingValue.incrementValue();
    terraformingValue.removeListener(incrementCallback);
  });

  test('decrementing TerraformingValue', () {
    final Terraforming terraformingValue = Terraforming();
    terraformingValue.history = History();
    final int startValue = terraformingValue.value;
    final VoidCallback decrementCallback = () {
      expect(terraformingValue.value, lessThan(startValue));
    };
    terraformingValue.addListener(decrementCallback);
    terraformingValue.decrementValue();
    terraformingValue.removeListener(decrementCallback);
  });

  test('nextRound greaterThem', () {
    final History history = History();
    final Terraforming terraforming = Terraforming();
    final Energy energy = Energy();
    final MegaCredits megacredits =
        MegaCredits().updateTerraformingValue(terraforming);

    terraforming.history = history;
    energy.history = history;
    megacredits.history = history;

    final int megaStartValue = megacredits.value;
    final int energyStartValue = energy.value;
    final int terraStartValue = terraforming.value;

    final VoidCallback megaNextRound = () {
      expect(megacredits.value, greaterThan(megaStartValue));
    };
    final VoidCallback energyNextRound = () {
      expect(energy.value, equals(energyStartValue));
    };
    final VoidCallback terraNextRound = () {
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
    final History history = History();
    final Terraforming terraforming = Terraforming();
    final Energy energy = Energy();
    final MegaCredits megacredits =
        MegaCredits().updateTerraformingValue(terraforming);

    terraforming.history = history;
    energy.history = history;
    megacredits.history = history;

    final VoidCallback megaNextRound = () {
      expect(41, equals(megacredits.value));
    };
    final VoidCallback energyNextRound = () {
      expect(1, equals(energy.value));
    };
    final VoidCallback terraNextRound = () {
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
