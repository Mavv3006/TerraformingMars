import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/elevatedCard.dart';
import 'package:terraforming_mars/layout/actionsLayout.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';
import 'package:terraforming_mars/layout/settingsLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/theme/colors.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final Radius _radius = Radius.circular(25);
  final Color _selectedColor = AppColors.accentColor;
  final Color _unselectedColor = AppColors.secondaryLight;
  final Radius _appBarRadius = Radius.circular(45);

  PageController _controller = PageController(initialPage: 0);
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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Terraforming()),
          ChangeNotifierProvider(create: (_) => Energy()),
          ChangeNotifierProvider(create: (_) => RessourceDataModel()),
          ChangeNotifierProvider(create: (_) => Steel()),
          ChangeNotifierProvider(create: (_) => Titan()),
          ChangeNotifierProvider(create: (_) => Crop()),
          ChangeNotifierProvider(create: (_) => Heat(RessourceDataModel.energy)),
          ChangeNotifierProvider<MegaCredits>(
            create: (_) => MegaCredits(RessourceDataModel.terraFormingValue),
          ),
        ],
        child: PageView(
          onPageChanged: (index) {
            onPageChanged(index);
          },
          controller: _controller,
          children: <Widget>[
            RessourceLayout(),
            ActionsLayout(),
            SettingsLayout(),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedCard(
        child: Container(
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
              Text(
                "Ressourcen",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: _ressourceColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 7,
                    ),
              ),
              Text("Aktionen",
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: _actionColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 7,
                      )),
              Text(
                "Einstellungen",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: _settingsColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 7,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPageChanged(int value) {
    setState(() {
      if (value == 0) {
        _ressourceColor = _selectedColor;
        _actionColor = _unselectedColor;
        _settingsColor = _unselectedColor;
      } else if (value == 1) {
        _ressourceColor = _unselectedColor;
        _actionColor = _selectedColor;
        _settingsColor = _unselectedColor;
      } else if (value == 2) {
        _ressourceColor = _unselectedColor;
        _actionColor = _unselectedColor;
        _settingsColor = _selectedColor;
      }
    });
  }
}
