import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('RessourceValue default value', () {
    final ressoureModel = Titan();
    expect(1, equals(ressoureModel.value));
  });

  test('RessourceValue startBy value', () {
    final ressourceModel = MegaCredits();
    final startValue = ressourceModel.value;
    expect(20, equals(startValue));
  });

  test('incrementing StartValue of RessourceValue', () {
    final ressourceModel =
        MegaCredits().updateHistory(History()).updateSetting(SettingsModel());
    ressourceModel.addListener(() {
      expect(21, equals(ressourceModel.value));
    });
    ressourceModel.incrementValue();
  });

  test('incrementing StartValue of RessourceValue', () {
    final ressourceModel =
        MegaCredits().updateHistory(History()).updateSetting(SettingsModel());
    final startProduction = ressourceModel.production;
    ressourceModel.addListener(() {
      expect(ressourceModel.production, greaterThan(startProduction));
    });
    ressourceModel.incrementProduction();
  });

  test('nextRound Energy', () {
    final energy = Energy();
    energy.history = History();
    final startValue = energy.value;
    VoidCallback listener = () {
      expect(energy.value, equals(startValue));
    };
    energy.addListener(listener);
    energy.nextRound();
    energy.removeListener(listener);
  });

  test('nextRound Titan', () {
    final titan = Titan();
    titan.history = History();
    final startValue = titan.value;
    VoidCallback listener = () {
      expect(titan.value, greaterThan(startValue));
    };
    titan.addListener(listener);
    titan.nextRound();
    titan.removeListener(listener);
  });

  test('undo Value', () {
    var energy = Energy();
    energy.history = History();
    HistoryMessageValue startValue =
        HistoryMessageValue(intValue: energy.value);
    energy.incrementValue();
    HistoryMessageValue newValue = HistoryMessageValue(intValue: energy.value);

    var historyMessage = HistoryMessage(
      oldValue: startValue,
      newValue: newValue,
      message: "Increment Energy Value",
      historyMessageType: HistoryMessageType.VALUE,
      type: Energy,
    );

    expect(DefaultRessourceValue.defaultValueValue + 1, equals(energy.value));
    energy.undo(historyMessage);
    expect(DefaultRessourceValue.defaultValueValue, equals(energy.value));
  });
}
