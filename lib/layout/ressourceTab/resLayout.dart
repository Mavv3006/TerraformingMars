import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

import 'ressourcesView.dart';

class ResLayout extends StatelessWidget {
  const ResLayout(this.ressourceValue);

  final RessourceValue ressourceValue;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
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
          RessourceButtonLayout(ressourceValue),
        ],
      ),
    );
  }
}
