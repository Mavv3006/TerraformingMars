import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class StandardProjects extends StatelessWidget {
  final double outsidePadding = 10;
  final double buttonWidth = 140;

  @override
  Widget build(BuildContext context) {
    var megaCredits = Provider.of<MegaCredits>(context);

    return CustomListElement(
      padding:
          EdgeInsets.only(left: outsidePadding, right: outsidePadding, top: 6),
      child: Column(
        children: <Widget>[
          RessourceValueText("Standard Projekte"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomTextInput(),
              ActionButton(
                text: "Karten verkaufen",
                onPressed: null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Kraftwerk bauen: +1 Energie Prod."),
              ActionButton(
                text: "11 MC",
                onPressed: null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Asteroid abstürzen: +2°C, +1 TFW"),
              ActionButton(
                text: "14 MC",
                onPressed: null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Ozean bewässern: +1 TFW"),
              ActionButton(
                text: "18 MC",
                onPressed: null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Wald pflanzen: +1 TFW"),
              ActionButton(
                text: "23 MC",
                onPressed: null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Stadt bauen: +1 MC Produktion"),
              ActionButton(
                text: "25 MC",
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
