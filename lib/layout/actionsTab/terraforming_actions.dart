import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/action/terraforming_switch_state.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';
import 'package:terraforming_mars/theme/colors.dart';

class TerraformingAction extends StatefulWidget {
  @override
  _TerraformingActionState createState() => _TerraformingActionState();
}

class _TerraformingActionState extends State<TerraformingAction> {
  final double outsidePadding = 25;

  @override
  Widget build(BuildContext context) {
    var crop = Provider.of<Crop>(context);
    var heat = Provider.of<Heat>(context);
    var terra = Provider.of<Terraforming>(context);
    var switchState = Provider.of<TerraformingSwitchState>(context);

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
                          if (switchState.currentState) {
                            terra.incrementValue();
                          }
                        }
                      : null,
                  text: "Temperatur erhöhen"),
              ActionButton(
                  buttonWidth: 130,
                  onPressed: crop.isValueEnoughForForest
                      ? () {
                          crop.buildForest();
                          if (switchState.currentState) {
                            terra.incrementValue();
                          }
                        }
                      : null,
                  text: "Wald bauen"),
            ],
          ),
          Row(
            children: <Widget>[
              RessourceValueText("mit TFW?"),
              Switch(
                activeColor: AppColors.accentColor,
                inactiveThumbColor: AppColors.primaryColor,
                inactiveTrackColor: AppColors.disabledButtonColor,
                value: switchState.currentState,
                onChanged: (newValue) => setState(
                  () {
                    switchState.currentState = newValue;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
