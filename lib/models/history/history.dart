import 'package:flutter/material.dart';
import 'package:terraforming_mars/exceptions/emptyHistoryException.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_message_widget.dart';

import 'historyMessage.dart';

class History extends ChangeNotifier {
  History() {
    _historyList = <HistoryMessage>[];
  }

  List<HistoryMessage> _historyList;

  void log(HistoryMessage message) {
    _historyList.add(message);
    print(message);
  }

  HistoryMessage getLastEntry() {
    if (_historyList.isEmpty) {
      throw const EmptyHistoryException('The history is empty');
    }
    notifyListeners();
    return _historyList.removeLast();
  }

  List<HistoryMessage> getAll() {
    return _historyList;
  }

  HistoryMessage getAtIndex(int index) {
    if (_historyList.isEmpty) {
      throw const EmptyHistoryException('The history is empty');
    }
    return _historyList[index];
  }

  int length() {
    return _historyList.length;
  }

  bool get isEmpty => _historyList.isEmpty;

  List<Widget> getWidgetList() {
    if (_historyList.isEmpty) {
      return <Widget>[
        const Center(
          child: Text('Du hast noch nichts gemacht'),
        )
      ];
    } else {
      return _historyList
          .map((HistoryMessage message) =>
              HistoryMessageWidget(historyMessage: message))
          .toList()
          .reversed
          .toList();
    }
  }
}
