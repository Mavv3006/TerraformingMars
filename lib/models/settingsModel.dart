import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

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

  void undo(HistoryMessage historyMessage) {
    switch (historyMessage.message) {
      case "SteelBuyValue":
        _undoSteel(historyMessage);
        break;
      case "TitanBuyValue":
        _undoTitan(historyMessage);
        break;
      case "CropTradeValue":
        _undoCrop(historyMessage);
        break;
      case "HeatTradeValue":
        _undoHeat(historyMessage);
        break;
      default:
        print("Setting.undo() - wrong HistoryMessage.message");
        break;
    }
  }

  set steelBuyValue(int value) {
    history.log(
      HistoryMessage(
        message: "SteelBuyValue",
        oldValue: _steelBuyValue,
        newValue: _steelBuyValue = value,
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  set titanBuyValue(int value) {
    history.log(
      HistoryMessage(
        message: "TitanBuyValue",
        oldValue: _titanBuyValue,
        newValue: _titanBuyValue = value,
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  set cropTradeValue(int value) {
    history.log(
      HistoryMessage(
        message: "CropTradeValue",
        oldValue: _cropTradeValue,
        newValue: _cropTradeValue = value,
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  set heatTradeValue(int value) {
    history.log(
      HistoryMessage(
        message: "HeatTradeValue",
        oldValue: _heatTradeValue,
        newValue: _heatTradeValue = value,
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  int get steelBuyValue => _steelBuyValue;

  int get titanBuyValue => _titanBuyValue;

  int get cropTradeValue => _cropTradeValue;

  int get heatTradeValue => _heatTradeValue;

  void _undoSteel(HistoryMessage historyMessage) {
    if (validateNewValue(historyMessage.newValue, this._steelBuyValue)) {
      this._steelBuyValue = historyMessage.oldValue;
    }
  }

  void _undoTitan(HistoryMessage historyMessage) {
    if (validateNewValue(historyMessage.newValue, this._titanBuyValue)) {
      this._titanBuyValue = historyMessage.oldValue;
    }}

  void _undoCrop(HistoryMessage historyMessage) {
    if (validateNewValue(historyMessage.newValue, this._cropTradeValue)) {
      this._cropTradeValue = historyMessage.oldValue;
    }}

  void _undoHeat(HistoryMessage historyMessage) {
    if (validateNewValue(historyMessage.newValue, this._heatTradeValue)) {
      this._heatTradeValue = historyMessage.oldValue;
    }}

  bool validateNewValue(int historyMessageNewValue, int currentValue) {
    return historyMessageNewValue == currentValue;
  }
}
