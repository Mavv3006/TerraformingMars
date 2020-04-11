import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class Terraforminglayout extends StatelessWidget {
  const Terraforminglayout(this.data);

  final Terraforming data;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText(
                data.title,
              ),
              AddButton(
                onPressed: data.incrementValue,
              ),
              RessourceValueText(
                data.valueToString,
              ),
              SubButton(
                onPressed:
                    data.isValueGreaterThenZero ? data.decrementValue : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
