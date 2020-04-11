import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/history_new_value.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_widget.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

class HistorySettingWidget extends HistoryWidget {
  HistorySettingWidget({
    Key key,
    @required HistoryMessage historyMessage,
  }) : super(key: key, historyMessage: historyMessage);

  Widget historyNewValue;

  @override
  Widget build(BuildContext context) {
    if (historyMessage.oldValue.intValue != null) {
      historyNewValue = HistoryNewIntValue(
        oldValue: historyMessage.oldValue.intValue,
        newValue: historyMessage.newValue.intValue,
      );
    } else {
      historyNewValue = HistoryNewBoolValue(
        oldValue: historyMessage.oldValue.boolValue,
        newValue: historyMessage.newValue.boolValue,
      );
    }

    return CustomListElement(
      padding: widgetPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RessourceValueText("Tauschwert:"),
              RessourceValueText(historyMessage.message),
            ],
          ),
          historyNewValue,
        ],
      ),
    );
  }
}
