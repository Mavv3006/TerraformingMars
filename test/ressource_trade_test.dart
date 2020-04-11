import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

void main() {
  test('build Forest w/ crop', () {
    final History history = History();
    final SettingsModel setting = SettingsModel().updateHistory(history);
    final Crop crop = Crop().updateHistory(history).updateSetting(setting);

    setting.cropTradeValue = 4;
    crop.buildForest();

    assert(setting.cropTradeValue == 4);
    assert(crop.value == (DefaultRessourceValue.defaultValueValue - 4));
  });

  test('increase Temperatur w/ heat', () {
    final History history = History();
    final SettingsModel setting = SettingsModel().updateHistory(history);
    final Heat heat = Heat()
        .updateHistory(history)
        .updateSetting(setting)
        .updateEnergy(Energy());

    setting.heatTradeValue = 4;
    heat.increaseTemperatur();

    assert(setting.heatTradeValue == 4);
    assert(heat.value == (DefaultRessourceValue.defaultValueValue - 4));
  });

  test('buy cards w/ steel', () {
    final History history = History();
    final SettingsModel setting = SettingsModel().updateHistory(history);
    final Steel steel = Steel().updateHistory(history).updateSetting(setting);

    const int steelValue = 2;
    const int cardValue = 3;

    setting.steelBuyValue = steelValue;
    steel.value += (cardValue / steelValue).round();
    steel.playCard(cardValue);

    assert(setting.steelBuyValue == steelValue);
    assert(steel.value == DefaultRessourceValue.defaultValueValue);
  });

  test('buy cards w/ titan', () {
    final History history = History();
    final SettingsModel setting = SettingsModel().updateHistory(history);
    final Titan titan = Titan().updateHistory(history).updateSetting(setting);

    const int titanValue = 2;
    const int cardValue = 4;

    setting.titanBuyValue = titanValue;
    titan.value += (cardValue / titanValue).round();
    titan.playAmount(cardValue);

    assert(setting.titanBuyValue == titanValue);
    assert(titan.value == DefaultRessourceValue.defaultValueValue);
  });

  test('titan value test', () {
    final History history = History();
    final SettingsModel setting = SettingsModel().updateHistory(history);
    final Titan titan = Titan().updateSetting(setting).updateHistory(history);

    setting.titanBuyValue = 1;
    titan.playAmount(1);

    assert(titan.value == 0);
  });
}
