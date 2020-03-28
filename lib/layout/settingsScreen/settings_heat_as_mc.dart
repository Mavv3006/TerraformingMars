import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/alert_dialog_button.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_switch.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/theme/alert_dialog_shape.dart';
import 'package:terraforming_mars/theme/colors.dart';
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
            RessourceValueText("Wärme als MegaCredits verwenden?"),
            Consumer<SettingsModel>(
              builder: (
                BuildContext context,
                SettingsModel value,
                Widget child,
              ) {
                return CustomSwitch(
                  value: value.heatAsMCSwitchState,
                  onChanged: (newValue) {
                    if (newValue) {
                      showDialog(context: context, builder: buildAlertDialog);
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

  Widget buildAlertDialog(BuildContext context) {
    return AlertDialog(
      shape: globalAlertDialogShape,
      titleTextStyle: Theme.of(context)
          .textTheme
          .title
          .copyWith(color: AppColors.accentColor),
      backgroundColor: AppColors.secondaryLight,
      title: Text("Möchtest du Wärme als Zahlungsmittel hinzufügen?"),
      actions: <Widget>[
        AlertDialogButton(
          text: "Ja",
          onPressed: () {
            Navigator.of(context).pop();
            Provider.of<SettingsModel>(
              context,
              listen: false,
            ).heatAsMCSwitchState = true;
          },
        ),
        AlertDialogButton(
          text: "Nein",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
