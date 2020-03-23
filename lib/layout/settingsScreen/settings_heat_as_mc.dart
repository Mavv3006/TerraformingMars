import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_switch.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/settings/settingsSwitchState.dart';
import 'package:terraforming_mars/theme/padding.dart';

class SettingsHeatAsMC extends StatefulWidget {
  @override
  _SettingsHeatAsMCState createState() => _SettingsHeatAsMCState();
}

class _SettingsHeatAsMCState extends State<SettingsHeatAsMC> {
  @override
  Widget build(BuildContext context) {
    var switchState = Provider.of<SettingsSwitchState>(context);

    return CustomListElement(
      padding: CustomPadding.settingsListTopBottomPadding,
      child: Padding(
        padding: CustomPadding.settingsListLeftRightPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RessourceValueText("Wärme als MegaCredits verwenden?"),
            CustomSwitch(
              value: switchState.currentState,
              onChanged: (newValue) {
                setState(() {
                  switchState.currentState = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
