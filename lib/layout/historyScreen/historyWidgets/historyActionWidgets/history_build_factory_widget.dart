import 'package:flutter/material.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_widget.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

class HistoryBuildFactoryWidget extends HistoryWidget {
  const HistoryBuildFactoryWidget({
    Key key,
    @required HistoryMessage historyMessage,
  }) : super(key: key, historyMessage: historyMessage);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
