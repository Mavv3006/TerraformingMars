import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_widget.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/theme/colors.dart';

class HistoryNextRoundWidget extends HistoryWidget {
  const HistoryNextRoundWidget({
    Key key,
    @required HistoryMessage historyMessage,
  }) : super(key: key, historyMessage: historyMessage);

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: widgetPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: RessourceValueText(historyMessage.message),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RessourceValueText(historyMessage.oldValue.intValue.toString()),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Icon(
                  historyMessage.production >= 0
                      ? CustomIcons.plus
                      : CustomIcons.minus,
                  color: AppColors.accentColor,
                  size: 12,
                ),
              ),
              RessourceValueText(historyMessage.production >= 0
                  ? historyMessage.production.toString()
                  : (historyMessage.production * (-1)).toString()),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Icon(
                  CustomIcons.equals,
                  color: AppColors.accentColor,
                  size: 12,
                ),
              ),
              RessourceValueText(historyMessage.newValue.intValue.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
