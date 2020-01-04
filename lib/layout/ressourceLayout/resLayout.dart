import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/theme/colors.dart';

class ResLayout extends StatelessWidget {
  final RessourceValue ressourceValue;

  final BoxDecoration _boxDecoration = BoxDecoration(
    color: AppColors.secondaryLight,
    border: Border.all(
      width: 3,
      color: AppColors.accentColor,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  ResLayout(this.ressourceValue, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      child: Column(
        children: <Widget>[
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText(ressourceValue.valueToString),
              RessourceValueText(ressourceValue.title),
              RessourceValueText(ressourceValue.productionToString),
            ],
          ),
          Row(
            children: <Widget>[
              AddButton(
                onPressed: () {},
              ),
              SubButton(
                onPressed: () {},
              ),
              TextButton(
                onPressed: () {},
                text: "Credits",
              ),
              AddButton(
                onPressed: null,
              ),
              SubButton(
                onPressed: null,
              ),
              TextButton(
                onPressed: null,
                text: "Credits",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
