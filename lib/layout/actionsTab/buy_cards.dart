import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';

class BuyCards extends StatelessWidget {
  final double outsidePadding = 32;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: EdgeInsets.only(
        left: outsidePadding,
        right: outsidePadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomTextInput(),
          ActionButton(
            onPressed: () {
              /*TODO: Action*/
            },
            text: "neue Karten kaufen",
          )
        ],
      ),
    );
  }
}
