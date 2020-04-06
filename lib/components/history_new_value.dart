import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'customIcons.dart';

class HistoryNewIntValue extends StatelessWidget {
  final iconPadding = EdgeInsets.only(left: 8, right: 8);

  final int oldValue;
  final int newValue;

  HistoryNewIntValue({this.oldValue, this.newValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RessourceValueText(oldValue.toString()),
        Padding(
          padding: iconPadding,
          child: Icon(
            CustomIcons.newValue,
            color: AppColors.accentColor,
          ),
        ),
        RessourceValueText(newValue.toString()),
      ],
    );
  }
}
class HistoryNewBoolValue extends StatelessWidget {
  final iconPadding = EdgeInsets.only(left: 8, right: 8);

  final bool oldValue;
  final bool newValue;

  HistoryNewBoolValue({this.oldValue, this.newValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RessourceValueText(oldValue.toString().toUpperCase()),
        Padding(
          padding: iconPadding,
          child: Icon(
            CustomIcons.newBoolValue,
            color: AppColors.accentColor,
          ),
        ),
        RessourceValueText(newValue.toString().toUpperCase()),
      ],
    );
  }
}
