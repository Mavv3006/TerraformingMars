import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('update History', () {
    final History history = History();
    final Crop crop = Crop();

    expect(null, crop.history);

    crop.updateHistory(history);

    expect(history, crop.history);
  });

  test('update Setting', () {
    final SettingsModel settingsModel = SettingsModel();
    final Crop crop = Crop();

    expect(null, crop.setting);

    crop.updateSetting(settingsModel);

    expect(settingsModel, crop.setting);
  });

  test('RessourceValue default value', () {
    final Titan ressoureModel = Titan();
    expect(1, equals(ressoureModel.dataModel.value));
  });

  test('RessourceValue startBy value', () {
    final MegaCredits ressourceModel = MegaCredits();
    final int startValue = ressourceModel.dataModel.value;
    expect(20, equals(startValue));
  });

  test('incrementing StartValue of RessourceValue', () {
    final History history = History();
    final SettingsModel settingsModel = SettingsModel();
    final MegaCredits megaCredits = MegaCredits();
    megaCredits.updateHistory(history);
    megaCredits.updateSetting(settingsModel);

    assert(megaCredits.history == history);

    megaCredits.addListener(() {
      expect(21, equals(megaCredits.dataModel.value));
    });
    megaCredits.incrementValue();
  });

  test('incrementing StartValue of RessourceValue', () {
    final MegaCredits ressourceModel =
        MegaCredits().updateHistory(History()).updateSetting(SettingsModel());
    final int startProduction = ressourceModel.dataModel.production;
    ressourceModel.addListener(() {
      expect(ressourceModel.dataModel.production, greaterThan(startProduction));
    });
    ressourceModel.incrementProduction();
  });

  test('nextRound Energy', () {
    final Energy energy = Energy();
    energy.history = History();
    final int startValue = energy.dataModel.value;
    final VoidCallback listener = () {
      expect(energy.dataModel.value, equals(startValue));
    };
    energy.addListener(listener);
    energy.nextRound();
    energy.removeListener(listener);
  });

  test('nextRound Titan', () {
    final Titan titan = Titan();
    titan.history = History();
    final int startValue = titan.dataModel.value;
    final VoidCallback listener = () {
      expect(titan.dataModel.value, greaterThan(startValue));
    };
    titan.addListener(listener);
    titan.nextRound();
    titan.removeListener(listener);
  });

  test('undo Value', () {
    final Energy energy = Energy();
    energy.history = History();
    final HistoryMessageValue startValue =
    HistoryMessageValue(intValue: energy.dataModel.value);
    energy.incrementValue();
    final HistoryMessageValue newValue =
    HistoryMessageValue(intValue: energy.dataModel.value);

    final HistoryMessage historyMessage = HistoryMessage(
      oldValue: startValue,
      newValue: newValue,
      message: 'Increment Energy Value',
      historyMessageType: HistoryMessageType.value,
      type: Energy,
    );

    expect(DefaultRessourceValue.defaultValueValue + 1,
        equals(energy.dataModel.value));
    energy.undo(historyMessage);
    expect(DefaultRessourceValue.defaultValueValue,
        equals(energy.dataModel.value));
  });
}
