import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/settings_list_element.dart';
import 'package:terraforming_mars/models/settingsModel.dart';

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

    return SettingsListElement(
      topText: "Pflanzen für einen Wald:",
      bottomText: "Wärme für +2°C:",
      topController: cropTradeValueController,
      bottomController: heatTradeValueController,
      topSubmitted: (String value) {
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
      bottomSubmitted: (String value) {
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
  }
}
