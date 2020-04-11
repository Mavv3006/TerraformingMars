import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

abstract class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key key, @required this.historyMessage})
      : super(key: key);
  final HistoryMessage historyMessage;

  EdgeInsets get widgetPadding =>
      const EdgeInsets.only(top: 6, left: 32, bottom: 6, right: 32);
}
