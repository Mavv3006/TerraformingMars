import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('adding Messages - history.length', () {
    final Energy energy = Energy();
    energy.history = History();

    energy.incrementValue();

    expect(1, energy.history.length());
  });

  test('undo function', () {
    final Titan titan = Titan();
    titan.history = History();

    titan.incrementValue();
    expect(2, equals(titan.value));

    titan.undo(titan.history.getLastEntry());
    expect(0, titan.history.length());
    expect(1, titan.value);
  });

  test('history message type', () {
    final History history = History();
    final Titan titan = Titan();
    final Energy energy = Energy();
    final Heat heat = Heat.withEnergy(energy: energy);
    final Steel steel = Steel();

    titan.history = history;
    energy.history = history;
    heat.history = history;
    steel.history = history;

    history.log(
      HistoryMessage(
        message: 'Titan - decrement Value',
        oldValue: HistoryMessageValue(intValue: 5),
        newValue: HistoryMessageValue(
          intValue: DefaultRessourceValue.defaultValueValue,
        ),
        type: Titan,
        historyMessageType: HistoryMessageType.value,
      ),
    );

    final HistoryMessage lastEntry = history.getLastEntry();
    switch (lastEntry.type) {
      case Steel:
        fail('Steel: wrong Type');
        break;
      case Energy:
        fail('Energy: wrong Type');
        break;
      case Heat:
        fail('Heat: wrong Type');
        break;
      case MegaCredits:
        fail('MegaCredits: wrong Type');
        break;
      case Titan:
        titan.undo(lastEntry);
        break;
      default:
        fail('Default: wrong Type');
        break;
    }

    expect(5, titan.value);
  });

  test('Crop nextRound', () {
    final Crop crop = Crop();
    crop.history = History();

    crop.nextRound();

    expect(
        DefaultRessourceValue.defaultValueValue +
            DefaultRessourceValue.defaultProductionValue,
        crop.value);
  });

  test('Crop increment Value', () {
    final Crop crop = Crop();
    crop.history = History();

    crop.incrementValue();

    expect(DefaultRessourceValue.defaultValueValue + 1, crop.value);
  });

  test('Crop decrement Value', () {
    final Crop crop = Crop();
    crop.history = History();

    crop.decrementValue();

    expect(DefaultRessourceValue.defaultValueValue - 1, crop.value);
  });

  test('Crop decrement Production', () {
    final Crop crop = Crop();
    crop.history = History();

    crop.decrementProduction();

    expect(DefaultRessourceValue.defaultProductionValue - 1, crop.production);
  });

  test('Crop increment Production', () {
    final Crop crop = Crop();
    crop.history = History();

    crop.incrementProduction();

    expect(DefaultRessourceValue.defaultProductionValue + 1, crop.production);
  });

  test('decrement Value', () {
    final Steel steel = Steel();
    steel.history = History();

    steel.decrementValue();

    expect(DefaultRessourceValue.defaultValueValue - 1, steel.value);
    expect(steel.value, steel.history.getLastEntry().newValue.intValue);
  });

  test('increment Value', () {
    final Steel steel = Steel();
    steel.history = History();

    steel.incrementValue();

    expect(DefaultRessourceValue.defaultValueValue + 1, steel.value);
    expect(steel.value, steel.history.getLastEntry().newValue.intValue);
  });

  test('HistoryMessageType without actionType', () {
    expect(
        () => HistoryMessage(
            message: null,
            oldValue: null,
            newValue: null,
            type: null,
            historyMessageType: HistoryMessageType.action),
        throwsA(isA<AssertionError>()));
  });

  test('HistoryMessageType without actionType', () {
    expect(
        () => HistoryMessage(
            message: 'null',
            oldValue: HistoryMessageValue(intValue: 1),
            newValue: HistoryMessageValue(intValue: 1),
            type: null,
            historyMessageType: HistoryMessageType.action,
            actionType: ActionType.BUILD_CITY),
        returnsNormally);
  });
}
