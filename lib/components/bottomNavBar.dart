import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  final Radius _radius = Radius.circular(25);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Ressourcen",
            style: Theme.of(context).textTheme.title.copyWith(
                  color: AppColors.accentColor,
                  decoration: TextDecoration.underline,
                  decorationThickness: 7,
                ),
          ),
          Text("Aktionen",
              style: Theme.of(context).textTheme.title.copyWith(
                    color: AppColors.secondaryLight,
                    decoration: TextDecoration.underline,
                    decorationThickness: 7,
                  )),
          Text(
            "Einstellungen",
            style: Theme.of(context).textTheme.title.copyWith(
                  color: AppColors.secondaryLight,
                  decoration: TextDecoration.underline,
                  decorationThickness: 7,
                ),
          ),
        ],
      ),
    );
  }
}
