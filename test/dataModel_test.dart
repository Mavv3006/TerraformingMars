import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';

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

  test('nextRound Energy',(){
    final energy = Energy();
    final startValue= energy.value;
    VoidCallback listener = (){
      expect(energy.value, equals(startValue));
    };
    energy.addListener(listener);
    energy.nextRound();
    energy.removeListener(listener);
  });

  test('nextRound Titan',(){
    final titan = Titan();
    final startValue= titan.value;
    VoidCallback listener = (){
      expect(titan.value, greaterThan(startValue));
    };
    titan.addListener(listener);
    titan.nextRound();
    titan.removeListener(listener);
  });
}
