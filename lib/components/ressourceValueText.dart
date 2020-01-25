import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class RessourceValueText extends StatelessWidget {
  final String title;

  RessourceValueText(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.body2.copyWith(
        color: AppColors.accentColor,
          shadows: <Shadow>[
            Shadow(
              color: AppColors.shadow,
              blurRadius: 2,
              offset: Offset(0, 1.5),
            ),
          ],
      ),
    );
  }
}
