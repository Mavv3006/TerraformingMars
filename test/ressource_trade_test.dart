import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('build Forest w/ crop', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    var crop = Crop().updateHistory(history).updateSetting(setting);

    setting.cropTradeValue = 4;
    crop.buildForest();

    assert(setting.cropTradeValue == 4);
    assert(crop.value == (DefaultRessourceValue.defaultValueValue - 4));
  });

  test('increase Temperatur w/ heat', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    var heat = Heat()
        .updateHistory(history)
        .updateSetting(setting)
        .updateEnergy(Energy());

    setting.heatTradeValue = 4;
    heat.increaseTemperatur();

    assert(setting.heatTradeValue == 4);
    assert(heat.value == (DefaultRessourceValue.defaultValueValue - 4));
  });

  test('buy cards w/ steel', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    var steel = Steel().updateHistory(history).updateSetting(setting);

    var steelValue = 2;
    var cardValue = 3;

    setting.steelBuyValue = steelValue;
    steel.value += steelValue * cardValue;
    steel.playCards(cardValue);

    assert(setting.steelBuyValue == steelValue);
    assert(steel.value == DefaultRessourceValue.defaultValueValue);
  });

  test('buy cards w/ titan', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    var titan = Titan().updateHistory(history).updateSetting(setting);

    var titanValue = 2;
    var cardValue = 3;

    setting.titanBuyValue = titanValue;
    titan.value += titanValue * cardValue;
    titan.playCards(cardValue);

    assert(setting.titanBuyValue == titanValue);
    assert(titan.value == DefaultRessourceValue.defaultValueValue);
  });

  test('titan value test', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    var titan = Titan().updateSetting(setting).updateHistory(history);

    setting.titanBuyValue = 1;
    titan.playCards(1);

    assert(titan.value == 0);
  });
}
