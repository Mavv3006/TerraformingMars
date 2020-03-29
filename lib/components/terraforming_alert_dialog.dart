import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/alert_dialog_shape.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'alert_dialog_button.dart';

class TerraformingAlertDialog extends StatelessWidget {
  final String acceptButtonTitle;
  final String declineButtonTitle;

  final String title;

  final VoidCallback acceptButtonOnPressed;
  final VoidCallback declineButtonOnPressed;

  final Widget child;

  TerraformingAlertDialog({
    this.acceptButtonTitle,
    this.declineButtonTitle,
    this.title,
    this.acceptButtonOnPressed,
    this.declineButtonOnPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentTextStyle: Theme.of(context)
          .textTheme
          .body1
          .copyWith(color: AppColors.accentColor),
      content: child == null ? null : child,
      shape: globalAlertDialogShape,
      titleTextStyle: Theme.of(context)
          .textTheme
          .title
          .copyWith(color: AppColors.accentColor),
      backgroundColor: AppColors.secondaryLight,
      title: Text(title),
      actions: <Widget>[
        AlertDialogButton(
          text: acceptButtonTitle,
          onPressed: acceptButtonOnPressed,
        ),
        AlertDialogButton(
          text: declineButtonTitle,
          onPressed: declineButtonOnPressed,
        ),
      ],
    );
    ;
  }
}
