import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

const ButtonThemeData globalButtonTheme = ButtonThemeData(
  buttonColor: AppColors.primaryColor,
  disabledColor: AppColors.disabledButtonColor,
  textTheme: ButtonTextTheme.accent,
  padding: EdgeInsets.zero,
  height: 21,
  minWidth: 42,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
