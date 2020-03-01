import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_switch.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';

class TerraformingAction extends StatelessWidget {
  final double outsidePadding = 25;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: EdgeInsets.only(left: outsidePadding, right: outsidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              ActionButton(
                buttonWidth: 130,
                  onPressed: () {
                    /*TODO:Action*/
                  },
                  text: "Temperatur erhöhen"),
              ActionButton(
                  buttonWidth: 130,
                  onPressed: () {
                    /*TODO:Action*/
                  },
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

