import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';

import 'custom_list_element.dart';
import 'custom_text_input.dart';

class SettingsListElement extends StatefulWidget {
  final double outsidePadding = 10;

  final TextEditingController topController;
  final TextEditingController bottomController;

  final ValueChanged<String> topSubmitted;
  final ValueChanged<String> bottomSubmitted;

  final String topText;
  final String bottomText;

  SettingsListElement({
    this.topController,
    this.bottomController,
    this.topText,
    this.bottomText,
    this.topSubmitted,
    this.bottomSubmitted,
  });

  @override
  _SettingsListElementState createState() => _SettingsListElementState();
}

class _SettingsListElementState extends State<SettingsListElement> {
  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: EdgeInsets.only(
        top: 6,
        bottom: 6,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: widget.outsidePadding, right: widget.outsidePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RessourceValueText(widget.topText),
                CustomTextInput(
                  widget.topController,
                  onSubmitted: widget.topSubmitted,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: widget.outsidePadding, right: widget.outsidePadding, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RessourceValueText(widget.bottomText),
                CustomTextInput(
                  widget.bottomController,
                  onSubmitted: widget.bottomSubmitted,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
