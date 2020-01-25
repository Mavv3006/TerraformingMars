import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/ressourceLayout/ressourceButtonLayout.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';
import 'package:terraforming_mars/theme/colors.dart';

class ResLayout extends StatelessWidget {
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

  final RessourceValue ressourceValue;

  ResLayout(this.ressourceValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      padding: EdgeInsets.only(top: 6.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText(ressourceValue.valueToString),
              RessourceValueText(ressourceValue.title),
              RessourceValueText(ressourceValue.productionToString),
            ],
          ),
          RessourceButtonLayout(
            incValue: ressourceValue.incrementValue,
            decValue: ressourceValue.decrementValue,
            incProd: ressourceValue.incrementProduction,
            decProd: ressourceValue.decrementProduction,
            isProdGreaterZero: ressourceValue.isProductionGreaterThenZero,
            isValueGreaterZero: ressourceValue.isValueGreaterThenZero,
          ),
        ],
      ),
    );
  }
}
