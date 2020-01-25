import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/ressourceLayout/ressourceButtonLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/theme/colors.dart';

class EnergyLayout extends StatelessWidget {
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

  final RessourceDataModel dataModel;

  EnergyLayout(this.dataModel);

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
              RessourceValueText(RessourceDataModel.energy.valueToString),
              RessourceValueText(RessourceDataModel.energy.title),
              RessourceValueText(RessourceDataModel.energy.productionToString),
            ],
          ),
          RessourceButtonLayout(
            incValue: dataModel.incrementEnergyValue,
            decValue: dataModel.decrementEnergyValue,
            incProd: dataModel.incrementEnergyProduction,
            decProd: dataModel.decrementEnergyProduction,
            isProdGreaterZero: dataModel.isEnergyProductionGreaterThenZero,
            isValueGreaterZero: dataModel.isEnergyValueGreaterThenZero,
          ),
        ],
      ),
    );
  }
}
