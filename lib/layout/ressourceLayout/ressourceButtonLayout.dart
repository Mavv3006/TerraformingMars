import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';

class RessourceButtonLayout extends StatelessWidget {
  final VoidCallback incValue;
  final VoidCallback decValue;
  final VoidCallback incProd;
  final VoidCallback decProd;
  final bool isValueGreaterZero;
  final bool isProdGreaterZero;

  RessourceButtonLayout(
      {this.incValue,
      this.decValue,
      this.decProd,
      this.incProd,
      this.isProdGreaterZero,
      this.isValueGreaterZero});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AddButton(
          onPressed: incValue,
        ),
        SubButton(
          onPressed: isValueGreaterZero
              ? decValue
              : null,
        ),
        AddButton(
          onPressed: incProd,
        ),
        SubButton(
          onPressed: isProdGreaterZero
              ? decProd
              : null,
        ),
      ],
    );
  }
}
