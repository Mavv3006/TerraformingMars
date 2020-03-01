import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_switch.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class TerraformingAction extends StatelessWidget {
  final double outsidePadding = 25;

  @override
  Widget build(BuildContext context) {
    var crop = Provider.of<Crop>(context);
    var heat = Provider.of<Heat>(context);

    return CustomListElement(
      padding: EdgeInsets.only(left: outsidePadding, right: outsidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              ActionButton(
                  buttonWidth: 130,
                  onPressed: heat.isValueEnoughForTemperaturIncrease
                      ? () {
                          heat.increaseTemperatur();
                          /*TODO: if switch == true => Terraforming.incrementValue()*/
                        }
                      : null,
                  text: "Temperatur erhöhen"),
              ActionButton(
                  buttonWidth: 130,
                  onPressed: crop.isValueEnoughForForest
                      ? () {
                          crop.buildForest();
                          /*TODO: if switch == true => Terraforming.incrementValue()*/
                        }
                      : null,
                  text: "Wald bauen"),
            ],
          ),
          Row(
            children: <Widget>[
              RessourceValueText("mit TFW?"),
              CustomSwitch(),
            ],
          ),
        ],
      ),
    );
  }
}
