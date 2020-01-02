import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myColors.dart';

class RessourceValueText extends StatelessWidget {
  final String title;

  RessourceValueText(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.body2.copyWith(
        color: MyColors.darkAccentColor,
        shadows: <Shadow>[
          Shadow(
            color: MyColors.shadow,
            blurRadius: 2,
            offset: Offset(
              0,
              3,
            ),
          ),
        ],
      ),
    );
  }
}
