import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/emptyHistoryException.dart';

import 'historyMessage.dart';

class History extends ChangeNotifier {
  List<HistoryMessage> _historyList;

  History() {
    _historyList = List<HistoryMessage>();
  }

  void log(HistoryMessage message) {
    _historyList.add(message);
  }

  HistoryMessage getLastEntry() {
    if (_historyList.isEmpty) {
      throw EmptyHistoryException("The history is empty");
    }
    return _historyList.removeLast();
  }

  List<HistoryMessage> getAll() {
    return _historyList;
  }

  HistoryMessage getAtIndex(int index) {
    if (_historyList.isEmpty) {
      throw EmptyHistoryException("The history is empty");
    }
    return _historyList[index];
  }

  int length() {
    return _historyList.length;
  }
}
