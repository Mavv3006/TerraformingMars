import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';
import 'package:terraforming_mars/theme/colors.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final Radius _radius = Radius.circular(25);
  final Color _selectedColor = AppColors.accentColor;
  final Color _unselectedColor = AppColors.secondaryLight;
  final double _bottomNavBarFontSize = 17;
  final double _titleFontSize = 28;

  Color _ressourceColor;
  Color _actionColor;
  Color _settingsColor;

  @override
  void initState() {
    _ressourceColor = _selectedColor;
    _actionColor = _unselectedColor;
    _settingsColor = _unselectedColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          elevation: 15,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Terraforming Mars",
            style: Theme.of(context).textTheme.display1.copyWith(
                  fontSize: _titleFontSize,
                  letterSpacing: 1.25,
                  color: AppColors.secondaryLight,
                ),
          ),
        ),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RessourceDataModel()),
          ChangeNotifierProvider(create: (_) => Steel()),
          ChangeNotifierProvider(create: (_) => Titan()),
          ChangeNotifierProvider(create: (_) => Crop()),
          ChangeNotifierProvider(
              create: (_) => Heat(RessourceDataModel.energy)),
          ChangeNotifierProvider<MegaCredits>(
            create: (_) => MegaCredits(RessourceDataModel.terraFormingValue),
          ),
        ],
        child: RessourceLayout(),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: _radius,
            topRight: _radius,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Aktionen",
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: _bottomNavBarFontSize,
                      color: _actionColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 7,
                    )),
            RaisedButton(
              child: Text(
                "Nächste Runde",
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: _bottomNavBarFontSize,
                      color: _ressourceColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 7,
                    ),
              ),
              onPressed: () {
                Provider.of<Heat>(context).nextRound();
                Provider.of<RessourceDataModel>(context).nextRound();
                Provider.of<MegaCredits>(context).nextRound();
                Provider.of<Titan>(context).nextRound();
                Provider.of<Steel>(context).nextRound();
                Provider.of<Crop>(context).nextRound();
              },
            ),
            Text(
              "Einstellungen",
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: _bottomNavBarFontSize,
                    color: _settingsColor,
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
