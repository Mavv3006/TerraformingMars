import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/theme/colors.dart';

class Terraforminglayout extends StatelessWidget {
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

  Terraforminglayout(this.dataModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      padding: EdgeInsets.only(top: 6.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText(RessourceDataModel.terraFormingValue.title),
              AddButton(
                onPressed: dataModel.incrementTerraformingValue,
              ),
              RessourceValueText(
                  RessourceDataModel.terraFormingValue.valueToString),
              SubButton(
                onPressed:
                    dataModel.isTerraformingValueGreaterThenZero
                        ? dataModel.decrementTerraformingValue
                        : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
