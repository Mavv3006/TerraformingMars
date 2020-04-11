import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/settings_text_input_row.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/theme/padding.dart';

class SettingsRessourceValue extends StatefulWidget {
  @override
  _SettingsRessourceValueState createState() => _SettingsRessourceValueState();
}

class _SettingsRessourceValueState extends State<SettingsRessourceValue> {
  final TextEditingController titanValueController = TextEditingController();
  final TextEditingController steelValueController = TextEditingController();

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
    setting = Provider.of<SettingsModel>(context, listen: false);

    steelValueController.value =
        TextEditingValue(text: setting.steelBuyValue.toString());
    titanValueController.value =
        TextEditingValue(text: setting.titanBuyValue.toString());

    final SettingsTextInputRow topListElement = SettingsTextInputRow(
      controller: steelValueController,
      text: 'Stahl zu MegaCredits:',
      onSubmitted: (String value) {
        try {
          final int newValue = int.parse(value);
          setting.steelBuyValue = newValue;
        } on FormatException catch (_) {
          // TODO(Marvin): Refactor into seperate Widget
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gebe eine Zahl ein'),
            ),
          );
        }
      },
    );

    final SettingsTextInputRow bottomListElement = SettingsTextInputRow(
      controller: titanValueController,
      text: 'Titan zu MegaCredits:',
      onSubmitted: (String value) {
        try {
          final int newValue = int.parse(value);
          setting.steelBuyValue = newValue;
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gebe eine Zahl ein'),
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
            padding: const EdgeInsets.only(top: 6.0),
            child: bottomListElement,
          ),
        ],
      ),
    );
  }
}
