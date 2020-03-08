
import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'customIcons.dart';

class HistoryNewValue extends StatelessWidget {
  final iconPadding = EdgeInsets.only(left: 8, right: 8);

  final int oldValue;
  final int newValue;

  HistoryNewValue({this.oldValue, this.newValue});

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