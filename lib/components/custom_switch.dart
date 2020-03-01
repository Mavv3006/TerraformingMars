import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = true;

  bool get value => _value;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColors.accentColor,
      inactiveThumbColor: AppColors.primaryColor,
      inactiveTrackColor: AppColors.disabledButtonColor,
      value: _value,
      onChanged: (newValue) => setState(
        () {
          _value = newValue;
        },
      ),
    );
  }
}
