import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

import 'history/history.dart';

class SettingsModel extends ChangeNotifier {

  int _steelBuyValue = DefaultSettingsValue.defaultSteelBuyValue;
  int _titanBuyValue = DefaultSettingsValue.defaultTitanBuyValue;

  int _cropTradeValue = DefaultSettingsValue.defaultCropTradeValue;
  int _heatTradeValue = DefaultSettingsValue.defaultHeatTradeValue;

  History history;

  SettingsModel updateHistory(History history) {
    this.history = history;
    return this;
  }

  void undo(HistoryMessage historyMessage) {}

  set steelBuyValue(int value) {
    print("new SteelBuyValue: $value");
    _steelBuyValue = value;
  }

  set titanBuyValue(int value) {
    print("new TitanBuyValue: $value");
    _titanBuyValue = value;
  }

  set cropTradeValue(int value) {
    print("new CropTradeValue: $value");
    _cropTradeValue = value;
  }

  set heatTradeValue(int value) {
    print("new HeatTradeValue: $value");
    _heatTradeValue = value;
  }

  int get steelBuyValue => _steelBuyValue;

  int get titanBuyValue => _titanBuyValue;

  int get cropTradeValue => _cropTradeValue;

  int get heatTradeValue => _heatTradeValue;

}
