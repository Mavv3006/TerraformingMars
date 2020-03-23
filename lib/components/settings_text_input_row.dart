import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/padding.dart';

import 'custom_text_input.dart';
import 'ressourceValueText.dart';

class SettingsTextInputRow extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final Function(String) onSubmitted;

  SettingsTextInputRow({
    this.controller,
    this.text,
    this.onSubmitted,
  });

  @override
  _SettingsTextInputRowState createState() => _SettingsTextInputRowState();
}

class _SettingsTextInputRowState extends State<SettingsTextInputRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.settingsListLeftRightPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RessourceValueText(widget.text),
          CustomTextInput(
            widget.controller,
            onSubmitted: widget.onSubmitted,
          ),
        ],
      ),
    );
  }
}
