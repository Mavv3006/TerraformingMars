import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'customIcons.dart';

class HistoryNewIntValue extends StatelessWidget {
  const HistoryNewIntValue({this.oldValue, this.newValue});

  final int oldValue;
  final int newValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RessourceValueText(oldValue.toString()),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
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
  const HistoryNewBoolValue({this.oldValue, this.newValue});

  final bool oldValue;
  final bool newValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RessourceValueText(oldValue.toString().toUpperCase()),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
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
