import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

import 'history/history.dart';

class SettingsModel extends ChangeNotifier {
  SettingsModel get copy => this;
  History history;

  SettingsModel updateHistory(History history) {
    this.history = history;
    return this;
  }

  void undo(HistoryMessage historyMessage) {}
}
