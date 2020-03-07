import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/actionsTab/sell_cards.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class StandardProjects extends StatelessWidget {
  final double outsidePadding = 10;
  final double buttonWidth = 140;

  @override
  Widget build(BuildContext context) {
    var mc = Provider.of<MegaCredits>(context);

    return CustomListElement(
      padding:
          EdgeInsets.only(left: outsidePadding, right: outsidePadding, top: 6),
      child: Column(
        children: <Widget>[
          RessourceValueText("Standard Projekte"),
          SellCards(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Kraftwerk bauen: +1 Energie Prod."),
              ActionButton(
                text: "11 MC",
                onPressed: mc.isValueEnoughForFactory
                    ? () {
                        mc.standardProject(ActionType.BUILD_FACTORY);
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Asteroid abstürzen: +2°C, +1 TFW"),
              ActionButton(
                text: "14 MC",
                onPressed: mc.isValueEnoughForAsteroid
                    ? () {
                        mc.standardProject(ActionType.ASTEROID);
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Ozean bewässern: +1 TFW"),
              ActionButton(
                text: "18 MC",
                onPressed: mc.isValueEnoughForOcean
                    ? () {
                        mc.standardProject(ActionType.BUILD_OCEAN);
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Wald pflanzen: +1 TFW"),
              ActionButton(
                text: "23 MC",
                onPressed: mc.isValueEnoughForForest
                    ? () {
                        mc.standardProject(ActionType.BUILD_FOREST_WITH_MC);
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RessourceValueText("Stadt bauen: +1 MC Produktion"),
              ActionButton(
                text: "25 MC",
                onPressed: mc.isValueEnoughForCity
                    ? () {
                        mc.standardProject(ActionType.BUILD_CITY);
                      }
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
