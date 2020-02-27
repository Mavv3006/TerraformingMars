import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class RessourceButtonLayout extends StatelessWidget {
  final RessourceValue resValue;

  RessourceButtonLayout(this.resValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AddButton(onPressed: resValue.incrementValue),
        SubButton(
            onPressed: resValue.isValueGreaterThenZero
                ? resValue.decrementValue
                : null),
        SizedBox(width: 25),
        AddButton(onPressed: resValue.incrementProduction),
        SubButton(
            onPressed: resValue.isProductionGreaterThenZero
                ? resValue.decrementProduction
                : null),
      ],
    );
  }
}
