import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/settings_text_input_row.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/theme/padding.dart';

class SettingsTradeValue extends StatefulWidget {
  @override
  _SettingsTradeValueState createState() => _SettingsTradeValueState();
}

class _SettingsTradeValueState extends State<SettingsTradeValue> {
  final heatTradeValueController = TextEditingController();
  final cropTradeValueController = TextEditingController();

  SettingsModel setting;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cropTradeValueController.dispose();
    heatTradeValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.setting = Provider.of<SettingsModel>(context, listen: false);

    heatTradeValueController.value =
        TextEditingValue(text: this.setting.heatTradeValue.toString());
    cropTradeValueController.value =
        TextEditingValue(text: this.setting.cropTradeValue.toString());

    var topListElement = SettingsTextInputRow(
      text: "Pflanzen für einen Wald:",
      controller: cropTradeValueController,
      onSubmitted: (String value) {
        try {
          int newValue = int.parse(value);
          setting.cropTradeValue = newValue;
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Gebe eine Zahl ein"),
            ),
          );
        }
      },
    );

    var bottomListElement = SettingsTextInputRow(
      text: "Wärme für +2°C:",
      controller: heatTradeValueController,
      onSubmitted: (String value) {
        try {
          int newValue = int.parse(value);
          setting.heatTradeValue = newValue;
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Gebe eine Zahl ein"),
            ),
          );
        }
      },
    );

    return CustomListElement(
      padding: CustomPadding.settingsListTopBottomPadding,
      child: Column(
        children: <Widget>[
          topListElement,
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: bottomListElement,
          ),
        ],
      ),
    );
  }
}
