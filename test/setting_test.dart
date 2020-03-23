import 'package:flutter_test/flutter_test.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';

void main() {
  test('log history Message: SteelBuyValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    setting.steelBuyValue = 1;

    assert(setting.steelBuyValue == 1);
    assert(history.getLastEntry().newValue == setting.steelBuyValue);
  });

  test('log history Message: TitanBuyValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    setting.titanBuyValue = 1;

    assert(setting.titanBuyValue == 1);
    assert(history.getLastEntry().newValue == setting.titanBuyValue);
  });

  test('log history Message: HeatTradeValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);
    setting.heatTradeValue = 1;

    assert(setting.heatTradeValue == 1);
    assert(history.getLastEntry().newValue == setting.heatTradeValue);
  });

  test('undo setting: SteelBuyValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);

    setting.steelBuyValue = 1;
    setting.undo(history.getLastEntry());

    assert(history.length() == 0);
    assert(setting.steelBuyValue == DefaultSettingsValue.defaultSteelBuyValue);
  });

  test('undo setting: HeatTradeValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);

    setting.heatTradeValue = 1;
    setting.undo(history.getLastEntry());

    assert(history.length() == 0);
    assert(
        setting.heatTradeValue == DefaultSettingsValue.defaultHeatTradeValue);
  });

  test('undo setting: CropValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);

    setting.cropTradeValue = 1;
    setting.undo(history.getLastEntry());

    assert(history.length() == 0);
    assert(
        setting.cropTradeValue == DefaultSettingsValue.defaultCropTradeValue);
  });

  test('undo setting: TitanValue', () {
    var history = History();
    var setting = SettingsModel().updateHistory(history);

    setting.titanBuyValue = 1;
    setting.undo(history.getLastEntry());

    assert(history.length() == 0);
    assert(setting.titanBuyValue == DefaultSettingsValue.defaultTitanBuyValue);
  });
}
