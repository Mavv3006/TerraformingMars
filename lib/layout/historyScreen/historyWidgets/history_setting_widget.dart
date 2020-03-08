import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_widget.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

class HistorySettingWidget extends HistoryWidget {
  HistorySettingWidget({
    Key key,
    @required HistoryMessage historyMessage,
  }) : super(key: key, historyMessage: historyMessage);

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      child: RessourceValueText(
          "noch nicht implementiert: ${historyMessage.historyMessageType}"),
    );
  }
}
