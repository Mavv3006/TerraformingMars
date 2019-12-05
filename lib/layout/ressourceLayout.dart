import 'package:flutter/material.dart';
import 'package:terraforming_mars/layout/ressourceValues.dart';


class RessourceLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.4,
      padding: const EdgeInsets.only(top: 5),
      children: <Widget>[
        RessourceValues.megaCredits,
        RessourceValues.steel,
        RessourceValues.titanium,
        RessourceValues.plant,
        RessourceValues.energy,
        RessourceValues.heat,
        RessourceValues.terraformingValue,
      ],
    );
  }
}
