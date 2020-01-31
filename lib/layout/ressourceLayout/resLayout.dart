import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/list_element.dart';
import 'package:terraforming_mars/layout/ressourceLayout/ressourceButtonLayout.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';

class ResLayout extends StatelessWidget {
  final RessourceValue ressourceValue;

  ResLayout(this.ressourceValue);

  @override
  Widget build(BuildContext context) {
    return ListElement(
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
          RessourceButtonLayout(this.ressourceValue),
        ],
      ),
    );
  }
}
