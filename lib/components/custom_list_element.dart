import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class CustomListElement extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CustomListElement({Key key, this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryLight,
        border: Border.all(
          width: 3,
          color: AppColors.accentColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: this.padding ?? EdgeInsets.only(top: 6.0),
      child: this.child,
    );
  }
}
