import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test("adding Messages - history.length", () {
    var energy = Energy();
    energy.history = History();

    energy.incrementValue();

    expect(1, energy.history.length());
  });

  test('undo function', () {
    var titan = Titan();
    titan.history = History();

    titan.incrementValue();
    expect(2, equals(titan.value));

    titan.undo(titan.history.getLastEntry());
    expect(0, titan.history.length());
    expect(1, titan.value);
  });

  test('history message type', () {
    var history = History();
    var titan = Titan();
    var energy = Energy();
    var heat = Heat.withEnergy(energy: energy);
    var steel = Steel();

    titan.history = history;
    energy.history = history;
    heat.history = history;
    steel.history = history;

    history.log(
      HistoryMessage(
        message: "Titan - decrement Value",
        oldValue: 5,
        newValue: DefaultValue.defaultValueValue,
        type: Titan,
        historyMessageType: HistoryMessageType.VALUE,
      ),
    );

    var lastEntry = history.getLastEntry();
    switch (lastEntry.type) {
      case Steel:
        fail("Steel: wrong Type");
        break;
      case Energy:
        fail("Energy: wrong Type");
        break;
      case Heat:
        fail("Heat: wrong Type");
        break;
      case MegaCredits:
        fail("MegaCredits: wrong Type");
        break;
      case Titan:
        titan.undo(lastEntry);
        break;
      default:
        fail("Default: wrong Type");
        break;
    }

    expect(5, titan.value);
  });

  test('Crop nextRound', () {
    var crop = Crop();
    crop.history = History();

    crop.nextRound();

    expect(DefaultValue.defaultValueValue + DefaultValue.defaultProductionValue,
        crop.value);
  });

  test('Crop increment Value', () {
    var crop = Crop();
    crop.history = History();

    crop.incrementValue();

    expect(DefaultValue.defaultValueValue + 1, crop.value);
  });
  test('Crop decrement Value', () {
    var crop = Crop();
    crop.history = History();

    crop.decrementValue();

    expect(DefaultValue.defaultValueValue - 1, crop.value);
  });
  test('Crop decrement Production', () {
    var crop = Crop();
    crop.history = History();

    crop.decrementProduction();

    expect(DefaultValue.defaultProductionValue - 1, crop.production);
  });
  test('Crop increment Production', () {
    var crop = Crop();
    crop.history = History();

    crop.incrementProduction();

    expect(DefaultValue.defaultProductionValue + 1, crop.production);
  });
}
