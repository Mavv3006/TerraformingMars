import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class AlertDialogButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  AlertDialogButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: AppColors.backgroundColor,
      child: Text(
        text,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: AppColors.accentColor,
            ),
      ),
      onPressed: onPressed,
    );
  }
}
