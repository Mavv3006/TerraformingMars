import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('RessourceValue default value', () {
    final ressoureModel = RessourceValue("test");
    expect(1, equals(ressoureModel.value));
  });

  test('RessourceValue startBy value', () {
    final ressourceModel = RessourceValue.startBy(startBy: 20, title: "test");
    final startValue = ressourceModel.value;
    expect(20, equals(startValue));
  });

  test('incrementing StartValue of RessourceValue', () {
    final ressourceModel = RessourceValue.startBy(startBy: 20, title: "test");
    ressourceModel.addListener(() {
      expect(21, equals(ressourceModel.value));
    });
    ressourceModel.incrementValue();
  });

  test('incrementing StartValue of RessourceValue', () {
    final ressourceModel = RessourceValue.startBy(startBy: 20, title: "test");
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
    int startValue = energy.value;
    energy.incrementValue();
    int newValue = energy.value;

    var historyMessage = HistoryMessage(
      oldValue: startValue,
      newValue: newValue,
      message: "Increment Energy Value",
      historyMessageType: HistoryMessageType.VALUE,
      type: Energy,
    );

    expect(DefaultValue.defaultValueValue + 1, equals(energy.value));
    energy.undo(historyMessage);
    expect(DefaultValue.defaultValueValue, equals(energy.value));
  });
}
