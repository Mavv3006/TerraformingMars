import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/settings_list_element.dart';
import 'package:terraforming_mars/models/settingsModel.dart';

class SettingsRessourceValue extends StatefulWidget {
  @override
  _SettingsRessourceValueState createState() => _SettingsRessourceValueState();
}

class _SettingsRessourceValueState extends State<SettingsRessourceValue> {
  final titanValueController = TextEditingController();
  final steelValueController = TextEditingController();

  SettingsModel setting;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    steelValueController.dispose();
    titanValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.setting = Provider.of<SettingsModel>(context, listen: false);

    steelValueController.value =
        TextEditingValue(text: this.setting.steelBuyValue.toString());
    titanValueController.value =
        TextEditingValue(text: this.setting.titanBuyValue.toString());

    return SettingsListElement(
      topText: "Stahl zu MegaCredits:",
      bottomText: "Titan zu MegaCredits:",
      topController: steelValueController,
      bottomController: titanValueController,
      topSubmitted: (String value) {
        try {
          int newValue = int.parse(value);
          setting.steelBuyValue = newValue;
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
          setting.titanBuyValue = newValue;
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
