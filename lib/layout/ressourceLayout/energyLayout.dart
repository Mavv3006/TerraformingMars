import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/list_element.dart';
import 'package:terraforming_mars/layout/ressourceLayout/ressourceButtonLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';

class EnergyLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListElement(
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
          RessourceButtonLayout(RessourceDataModel.energy),
        ],
      ),
    );
  }
}
