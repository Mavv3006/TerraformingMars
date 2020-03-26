import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;

  CustomSwitch({
    this.value,
    this.onChanged,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColors.accentColor,
      inactiveThumbColor: AppColors.primaryColor,
      inactiveTrackColor: AppColors.disabledButtonColor,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}