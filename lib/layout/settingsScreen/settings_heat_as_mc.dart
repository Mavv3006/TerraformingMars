import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_switch.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/components/terraforming_alert_dialog.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/theme/padding.dart';

class SettingsHeatAsMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      padding: CustomPadding.settingsListTopBottomPadding,
      child: Padding(
        padding: CustomPadding.settingsListLeftRightPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const RessourceValueText('Wärme als MegaCredits verwenden?'),
            Consumer<SettingsModel>(
              builder: (
                BuildContext context,
                SettingsModel value,
                Widget child,
              ) {
                return CustomSwitch(
                  value: value.heatAsMCSwitchState,
                  onChanged: (bool newValue) {
                    if (newValue) {
                      showDialog<Widget>(
                        context: context,
                        builder: (BuildContext context) {
                          return TerraformingAlertDialog(
                            title:
                                'Möchtest du Wärme als Zahlungsmittel hinzufügen?',
                            acceptButtonTitle: 'Ja',
                            acceptButtonOnPressed: () {
                              Navigator.of(context).pop();
                              Provider.of<SettingsModel>(
                                context,
                                listen: false,
                              ).heatAsMCSwitchState = true;
                            },
                            declineButtonTitle: 'Nein',
                            declineButtonOnPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    } else {
                      value.heatAsMCSwitchState = false;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
