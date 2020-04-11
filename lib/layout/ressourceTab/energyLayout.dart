import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

import 'ressourcesView.dart';

class EnergyLayout extends StatelessWidget {
  const EnergyLayout(this.data);

  final Energy data;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText(data.valueToString),
              RessourceValueText(data.title),
              RessourceValueText(data.productionToString),
            ],
          ),
          RessourceButtonLayout(data),
        ],
      ),
    );
  }
}
