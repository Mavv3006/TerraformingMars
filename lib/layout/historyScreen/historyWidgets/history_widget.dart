import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

abstract class HistoryWidget extends StatelessWidget {
  final HistoryMessage historyMessage;
  final widgetPadding = EdgeInsets.only(top: 6, left: 32, bottom: 6, right: 32);

  HistoryWidget({Key key, @required this.historyMessage})
      : super(key: key);
}
