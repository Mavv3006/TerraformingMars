import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

import 'historyActionWidgets/history_action_widget.dart';
import 'history_next_round_widget.dart';
import 'history_setting_widget.dart';
import 'history_value_production_widget.dart';

class HistoryMessageWidget extends StatelessWidget {
  final HistoryMessage historyMessage;

  HistoryMessageWidget({Key key, @required this.historyMessage})
      : super(key: key);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (historyMessage.historyMessageType) {
      case HistoryMessageType.PRODUCTION:
      case HistoryMessageType.VALUE:
        return HistoryValueProductionWidget(historyMessage: historyMessage);
      case HistoryMessageType.NEXT_ROUND:
        return HistoryNextRoundWidget(historyMessage: historyMessage);
      case HistoryMessageType.ACTION:
        return HistoryActionWidget(historyMessage: historyMessage);
      case HistoryMessageType.SETTING:
        return HistorySettingWidget(historyMessage: historyMessage);
    }
  }
}
