import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'historyMessageType.dart';

class HistoryMessage {
  final String message;
  final int oldValue;
  final int newValue;
  final int production;
  final Type type;
  final HistoryMessageType historyMessageType;

  final iconPadding = EdgeInsets.only(left: 8, right: 8);

  HistoryMessage({
    @required this.message,
    @required this.oldValue,
    @required this.newValue,
    @required this.type,
    @required this.historyMessageType,
    this.production,
  });

  Widget convertToWidget() {
    if (this.historyMessageType == HistoryMessageType.VALUE ||
        this.historyMessageType == HistoryMessageType.PRODUCTION) {
      return CustomListElement(
        padding: EdgeInsets.only(
          top: 6,
          left: 32,
          bottom: 6,
          right: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RessourceValueText(this.message),
            Row(
              children: <Widget>[
                RessourceValueText(this.oldValue.toString()),
                Padding(
                  padding: iconPadding,
                  child: Icon(
                    CustomIcons.newValue,
                    color: AppColors.accentColor,
                  ),
                ),
                RessourceValueText(this.newValue.toString()),
              ],
            ),
          ],
        ),
      );
    } else if (this.historyMessageType == HistoryMessageType.NEXT_ROUND) {
      return CustomListElement(
        padding: EdgeInsets.only(
          top: 6,
          left: 12,
          bottom: 6,
          right: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: RessourceValueText(this.message),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RessourceValueText(this.oldValue.toString()),
                Padding(
                  padding: iconPadding,
                  child: Icon(
                    this.production >= 0 ? CustomIcons.plus : CustomIcons.minus,
                    color: AppColors.accentColor,
                    size: 12,
                  ),
                ),
                RessourceValueText(this.production >= 0
                    ? this.production.toString()
                    : (this.production * (-1)).toString()),
                Padding(
                  padding: iconPadding,
                  child: Icon(
                    CustomIcons.equals,
                    color: AppColors.accentColor,
                    size: 12,
                  ),
                ),
                RessourceValueText(this.newValue.toString()),
              ],
            ),
          ],
        ),
      );
    } else {
      return CustomListElement(
        child: RessourceValueText(
            "noch nicht implementiert: ${this.historyMessageType}"),
      );
    }
  }
}
