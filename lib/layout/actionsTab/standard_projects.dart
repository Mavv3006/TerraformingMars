import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/actionsTab/sell_cards.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/action/terraforming_switch_state.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class StandardProjects extends StatelessWidget {
  final double outsidePadding = 10;
  final double buttonWidth = 140;

  @override
  Widget build(BuildContext context) {
    final MegaCredits mc = Provider.of<MegaCredits>(context);
    final TerraformingSwitchState switchState =
        Provider.of<TerraformingSwitchState>(context);

    return CustomListElement(
      padding:
          EdgeInsets.only(left: outsidePadding, right: outsidePadding, top: 6),
      child: Column(
        children: <Widget>[
          const RessourceValueText('Standard Projekte'),
          SellCards(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const RessourceValueText('Kraftwerk bauen: +1 Energie Prod.'),
              ActionButton(
                text: '11 MC',
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
              Consumer<TerraformingSwitchState>(
                builder: (BuildContext context, TerraformingSwitchState value,
                    Widget child) {
                  String text = 'Asteroid abstürzen: +2°C';
                  if (value.currentState) {
                    text += ', +1 TFW';
                  }
                  return RessourceValueText(text);
                },
              ),
              ActionButton(
                text: '14 MC',
                onPressed: mc.isValueEnoughForAsteroid
                    ? () {
                        mc.standardProject(ActionType.ASTEROID);
                        if (switchState.currentState) {
                          Provider.of<Terraforming>(context, listen: false)
                              .incrementValue();
                        }
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Consumer<TerraformingSwitchState>(
                builder: (BuildContext context, TerraformingSwitchState value,
                    Widget child) {
                  String text = 'Ozean bewässern';
                  if (value.currentState) {
                    text += ': +1 TFW';
                  }
                  return RessourceValueText(text);
                },
              ),
              ActionButton(
                text: '18 MC',
                onPressed: mc.isValueEnoughForOcean
                    ? () {
                        mc.standardProject(ActionType.BUILD_OCEAN);
                        if (switchState.currentState) {
                          Provider.of<Terraforming>(context, listen: false)
                              .incrementValue();
                        }
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Consumer<TerraformingSwitchState>(
                builder: (BuildContext context, TerraformingSwitchState value,
                    Widget child) {
                  String text = 'Wald pflanzen';
                  if (value.currentState) {
                    text += ': +1 TFW';
                  }
                  return RessourceValueText(text);
                },
              ),
              ActionButton(
                text: '23 MC',
                onPressed: mc.isValueEnoughForForest
                    ? () {
                        mc.standardProject(ActionType.BUILD_FOREST_WITH_MC);
                        if (switchState.currentState) {
                          Provider.of<Terraforming>(context, listen: false)
                              .incrementValue();
                        }
                      }
                    : null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const RessourceValueText('Stadt bauen: +1 MC Produktion'),
              ActionButton(
                text: '25 MC',
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
