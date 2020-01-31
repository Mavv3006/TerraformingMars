import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/list_element.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';

class Terraforminglayout extends StatelessWidget {
  final RessourceDataModel dataModel;

  Terraforminglayout(this.dataModel);

  @override
  Widget build(BuildContext context) {
    return ListElement(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText(
                RessourceDataModel.terraFormingValue.title,
              ),
              AddButton(
                onPressed: dataModel.incrementTerraformingValue,
              ),
              RessourceValueText(
                RessourceDataModel.terraFormingValue.valueToString,
              ),
              SubButton(
                onPressed: dataModel.isTerraformingValueGreaterThenZero
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
