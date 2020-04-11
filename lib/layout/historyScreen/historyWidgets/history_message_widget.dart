import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/history/historyMessageType.dart';

import 'historyActionWidgets/history_action_widget.dart';
import 'history_next_round_widget.dart';
import 'history_setting_widget.dart';
import 'history_value_production_widget.dart';

class HistoryMessageWidget extends StatelessWidget {
  const HistoryMessageWidget({Key key, @required this.historyMessage})
      : super(key: key);

  final HistoryMessage historyMessage;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (historyMessage.historyMessageType) {
      case HistoryMessageType.production:
      case HistoryMessageType.value:
        return HistoryValueProductionWidget(historyMessage: historyMessage);
      case HistoryMessageType.nextRound:
        return HistoryNextRoundWidget(historyMessage: historyMessage);
      case HistoryMessageType.action:
        return HistoryActionWidget(historyMessage: historyMessage);
      case HistoryMessageType.setting:
        return HistorySettingWidget(historyMessage: historyMessage);
    }
  }
}
