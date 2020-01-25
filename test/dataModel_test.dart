import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';

void main() {
  test('RessourceValue default value', () {
    final ressoureModel = RessourceValue("test");
    final startValue = ressoureModel.value;
    expect(0, equals(startValue));
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
    print(startProduction);
    ressourceModel.addListener(() {
      expect(ressourceModel.production, greaterThan(startProduction));
    });
    ressourceModel.incrementProduction();
    print(ressourceModel.production);
  });
}
