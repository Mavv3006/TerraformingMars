import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myColors.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';

class InheritedLayout extends StatelessWidget {
  final Radius _appBarRadius = Radius.circular(45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: _appBarRadius,
              bottomRight: _appBarRadius,
            ),
          ),
          backgroundColor: MyColors.lightAccentColor,
          title: Text(
            "Terraforming Mars",
            style: TextStyle(
              letterSpacing: 1.3,
              color: MyColors.lightBackgroundColor,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Center(child: RessourceLayout()),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x20000000),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(
                0,
                -3,
              ),
            ),
          ],
          color: MyColors.lightAccentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Ressourcen",
              style: Theme.of(context).textTheme.title.copyWith(
                    color: MyColors.darkAccentColor,
                    decoration: TextDecoration.underline,
                    decorationThickness: 7,
                  ),
            ),
            Text("Aktionen",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: MyColors.lightBackgroundColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 7,
                    )),
            Text(
              "Einstellungen",
              style: Theme.of(context).textTheme.title.copyWith(
                    color: MyColors.lightBackgroundColor,
                    decoration: TextDecoration.underline,
                    decorationThickness: 7,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
