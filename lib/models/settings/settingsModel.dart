import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

class SettingsModel extends ChangeNotifier {
  static const String steelHistoryString = 'Stahl zu MegaCredits';
  static const String titanHistoryString = 'Titan zu MegaCredits';
  static const String cropHistoryString = 'Pflanze zu Wald';
  static const String heatHistoryString = 'Wärme zu Temperatur';
  static const String heatSwitchHistoryString = 'Wärme als MegaCredits';

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
          historyMessageType: HistoryMessageType.setting),
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
        historyMessageType: HistoryMessageType.setting,
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
        historyMessageType: HistoryMessageType.setting,
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
        historyMessageType: HistoryMessageType.setting,
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
        historyMessageType: HistoryMessageType.setting,
      ),
    );
  }

  SettingsModel updateHistory(History history) {
    history = history;
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
        print('Setting.undo() - wrong HistoryMessage.message');
        break;
    }
  }

  void _undoSteel(HistoryMessage historyMessage) {
    if (validateNewIntValue(historyMessage.newValue.intValue, _steelBuyValue)) {
      _steelBuyValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoTitan(HistoryMessage historyMessage) {
    if (validateNewIntValue(historyMessage.newValue.intValue, _titanBuyValue)) {
      _titanBuyValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoCrop(HistoryMessage historyMessage) {
    if (validateNewIntValue(
        historyMessage.newValue.intValue, _cropTradeValue)) {
      _cropTradeValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoHeat(HistoryMessage historyMessage) {
    if (validateNewIntValue(
        historyMessage.newValue.intValue, _heatTradeValue)) {
      _heatTradeValue = historyMessage.oldValue.intValue;
    }
  }

  void _undoHeatSwitch(HistoryMessage historyMessage) {
    if (validateNewBoolValue(
        historyMessage.newValue.boolValue, _heatAsMCSwitchState)) {
      _heatAsMCSwitchState = historyMessage.oldValue.boolValue;
    }
  }

  bool validateNewIntValue(int historyMessageNewValue, int currentValue) {
    return historyMessageNewValue == currentValue;
  }

  bool validateNewBoolValue(bool historyMessageNewValue, bool currentValue) {
    return historyMessageNewValue == currentValue;
  }
}
