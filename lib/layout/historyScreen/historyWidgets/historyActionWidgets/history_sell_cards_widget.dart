import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/history_new_value.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_widget.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

class HistorySellCardsWidget extends HistoryWidget {
  HistorySellCardsWidget({
    Key key,
    @required HistoryMessage historyMessage,
  }) : super(key: key, historyMessage: historyMessage);

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: widgetPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RessourceValueText(historyMessage.message),
              RessourceValueText("MegaCredits - Anzahl"),
            ],
          ),
          HistoryNewValue(
            oldValue: historyMessage.oldValue,
            newValue: historyMessage.newValue,
          ),
        ],
      ),
    );
  }
}
