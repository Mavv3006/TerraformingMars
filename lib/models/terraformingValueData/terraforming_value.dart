import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';

abstract class TerraformingValue extends ChangeNotifier {
  TerraformingValue(this._title);

  String _getHistoryMessageText() => '$title - ';

  String getHistoryMessgeProductionText() {
    return _getHistoryMessageText() + HistoryMessageTypeString.production;
  }

  String getHistoryMessageValueText() {
    return _getHistoryMessageText() + HistoryMessageTypeString.value;
  }

  String getHistoryMessgeNextRoundText() {
    return _getHistoryMessageText() + HistoryMessageTypeString.nextRound;
  }

  History history;

  SettingsModel setting;

  final String _title;

  bool get isValueGreaterThenZero;

  String get title => _title;

  String get valueToString;

  void incrementValue();

  void decrementValue();

  void nextRound();

  void undo(HistoryMessage historyMessage);

  void undoValue(HistoryMessage historyMessage);

  TerraformingValue updateHistory(History history);

  TerraformingValue updateSetting(SettingsModel setting);
}
