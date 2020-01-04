import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/bottomNavBar.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';
import 'package:terraforming_mars/theme/colors.dart';

class InheritedLayout extends StatelessWidget {
  final Radius _appBarRadius = Radius.circular(45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: _appBarRadius,
              bottomRight: _appBarRadius,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Terraforming Mars",
            style: Theme.of(context).textTheme.display1.copyWith(
                  letterSpacing: 1.25,
                  color: AppColors.secondaryLight,
                ),
          ),
        ),
      ),
      body: RessourceLayout(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
