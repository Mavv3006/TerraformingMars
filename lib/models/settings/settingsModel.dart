import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

class SettingsModel extends ChangeNotifier {
  static const steelHistoryString = "Stahl zu MegaCredits";
  static const titanHistoryString = "Titan zu MegaCredits";
  static const cropHistoryString = "Pflanze zu Wald";
  static const heatHistoryString = "Wärme zu Temperatur";
  static const heatSwitchHistoryString = "Wärme als MegaCredits";

  History history;

  int _steelBuyValue = DefaultSettingsValue.defaultSteelBuyValue;
  int _titanBuyValue = DefaultSettingsValue.defaultTitanBuyValue;

  int _cropTradeValue = DefaultSettingsValue.defaultCropTradeValue;
  int _heatTradeValue = DefaultSettingsValue.defaultHeatTradeValue;

  bool _heatAsMCSwitchState = false;

  bool get heatAsMCSwitchState => _heatAsMCSwitchState;

  int get steelBuyValue => _steelBuyValue;

  int get titanBuyValue => _titanBuyValue;

  int get cropTradeValue => _cropTradeValue;

  int get heatTradeValue => _heatTradeValue;

  set heatAsMCSwitchState(bool value) {
    history.log(
      HistoryMessage(
          message: heatSwitchHistoryString,
          oldValue: HistoryMessageValue(boolValue: _heatAsMCSwitchState),
          newValue:
              HistoryMessageValue(boolValue: _heatAsMCSwitchState = value),
          type: SettingsModel,
          historyMessageType: HistoryMessageType.SETTING),
    );
    notifyListeners();
  }

  set steelBuyValue(int value) {
    history.log(
      HistoryMessage(
        message: steelHistoryString,
        oldValue: HistoryMessageValue(intValue: _steelBuyValue),
        newValue: HistoryMessageValue(intValue: _steelBuyValue = value),
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  set titanBuyValue(int value) {
    history.log(
      HistoryMessage(
        message: titanHistoryString,
        oldValue: HistoryMessageValue(intValue: _titanBuyValue),
        newValue: HistoryMessageValue(intValue: _titanBuyValue = value),
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  set cropTradeValue(int value) {
    history.log(
      HistoryMessage(
        message: cropHistoryString,
        oldValue: HistoryMessageValue(intValue: _cropTradeValue),
        newValue: HistoryMessageValue(intValue: _cropTradeValue = value),
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  set heatTradeValue(int value) {
    history.log(
      HistoryMessage(
        message: heatHistoryString,
        oldValue: HistoryMessageValue(intValue: _heatTradeValue),
        newValue: HistoryMessageValue(intValue: _heatTradeValue = value),
        type: SettingsModel,
        historyMessageType: HistoryMessageType.SETTING,
      ),
    );
  }

  SettingsModel updateHistory(History history) {
    this.history = history;
    return this;
  }

  void undo(HistoryMessage historyMessage) {
    switch (historyMessage.message) {
      case steelHistoryString:
        _undoSteel(historyMessage);
        break;
      case titanHistoryString:
        _undoTitan(historyMessage);
        break;
      case cropHistoryString:
        _undoCrop(historyMessage);
        break;
      case heatHistoryString:
        _undoHeat(historyMessage);
        break;
      case heatSwitchHistoryString:
        _undoHeatSwitch(historyMessage);
        break;
      default:
        print("Setting.undo() - wrong HistoryMessage.message");
        break;
    }
  }

  void _undoSteel(HistoryMessage historyMessage) {
    if (validateNewIntValue(
        historyMessage.newValue.intValue, this._steelBuyValue)) {
      this._steelBuyValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoTitan(HistoryMessage historyMessage) {
    if (validateNewIntValue(
        historyMessage.newValue.intValue, this._titanBuyValue)) {
      this._titanBuyValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoCrop(HistoryMessage historyMessage) {
    if (validateNewIntValue(
        historyMessage.newValue.intValue, this._cropTradeValue)) {
      this._cropTradeValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoHeat(HistoryMessage historyMessage) {
    if (validateNewIntValue(
        historyMessage.newValue.intValue, this._heatTradeValue)) {
      this._heatTradeValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoHeatSwitch(HistoryMessage historyMessage) {
    if (validateNewBoolValue(
        historyMessage.newValue.boolValue, this._heatAsMCSwitchState)) {
      this._heatAsMCSwitchState = historyMessage.oldValue.boolValue;
    }
  }

  bool validateNewIntValue(int historyMessageNewValue, int currentValue) {
    return historyMessageNewValue == currentValue;
  }

  bool validateNewBoolValue(bool historyMessageNewValue, bool currentValue) {
    return historyMessageNewValue == currentValue;
  }
}
