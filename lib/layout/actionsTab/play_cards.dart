import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';

class PlayCards extends StatelessWidget {
  final double outsidePadding = 32;
  final double buttonWidth = 50;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: EdgeInsets.only(
        left: outsidePadding,
        right: outsidePadding,
        top: 6,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomTextInput(),
              RessourceValueText("Karten ausspielen"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ActionButton(
                buttonWidth: buttonWidth,
                text: "Credits",
                onPressed: () {
                  /*TODO: Action*/
                },
              ),
              ActionButton(
                buttonWidth: buttonWidth,
                text: "Stahl",
                onPressed: () {
                  /*TODO: Action*/
                },
              ),
              ActionButton(
                buttonWidth: buttonWidth,
                text: "Titan",
                onPressed: () {
                  /*TODO: Action*/
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
