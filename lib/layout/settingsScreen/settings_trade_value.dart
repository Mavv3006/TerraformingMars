import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/settings_list_element.dart';
import 'package:terraforming_mars/models/defaultValue.dart';
import 'package:terraforming_mars/models/settingsModel.dart';

class SettingsTradeValue extends StatefulWidget {
  @override
  _SettingsTradeValueState createState() => _SettingsTradeValueState();
}

class _SettingsTradeValueState extends State<SettingsTradeValue> {
  final heatTradeValueController = TextEditingController.fromValue(
    TextEditingValue(
      text: DefaultSettingsValue.defaultHeatTradeValue.toString(),
    ),
  );
  final cropTradeValueController = TextEditingController.fromValue(
    TextEditingValue(
      text: DefaultSettingsValue.defaultCropTradeValue.toString(),
    ),
  );

  SettingsModel settingsModel;

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
    this.settingsModel = Provider.of<SettingsModel>(context, listen: false);

    return SettingsListElement(
      topText: "Pflanzen für einen Wald:",
      bottomText: "Wärme für +2°C:",
      topController: cropTradeValueController,
      bottomController: heatTradeValueController,
      topSubmitted: (String value) {
        try {
          int newValue = int.parse(value);
          settingsModel.cropTradeValue = newValue;
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
          settingsModel.heatTradeValue = newValue;
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
