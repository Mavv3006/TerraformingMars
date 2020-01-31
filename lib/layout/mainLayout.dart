import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/layout/actionsLayout.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';
import 'package:terraforming_mars/layout/settingsLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';
import 'package:terraforming_mars/theme/colors.dart';

class MainLayout extends StatelessWidget {
  final Color _appBarColor = AppColors.secondaryLight;
  final Color _backgroundColor = AppColors.backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          bottom: TabBar(
            labelColor: _appBarColor,
            tabs: [
              Tab(text: "Ressourcen"),
              Tab(text: "Aktionen"),
            ],
          ),
          title: Text(
            "Terraforming Mars",
            style: Theme.of(context).textTheme.title.copyWith(
                  color: _appBarColor,
                ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Provider.of<Crop>(context, listen: false).nextRound();
                Provider.of<Heat>(context, listen: false).nextRound();
                Provider.of<RessourceDataModel>(context, listen: false)
                    .nextRound();
                Provider.of<MegaCredits>(context, listen: false).nextRound();
                Provider.of<Titan>(context, listen: false).nextRound();
                Provider.of<Steel>(context, listen: false).nextRound();
              },
              icon: Icon(
                CustomIcons.nextRound,
                color: _appBarColor,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                CustomIcons.history,
                color: _appBarColor,
              ),
            ),
            IconButton(
              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) {
////                      SettingsModel settingsModel = Provider.of<SettingsModel>(context, listen: false).copy;
//                      Heat heat = Provider.of<Heat>(context, listen: false).copy();
//                      return SettingsLayout(
////                      settingsModel: settingsModel,
//                      heat: heat,
//                    );
//                    },
//                  ),
//                );
              },
              icon: Icon(
                CustomIcons.settings,
                color: _appBarColor,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            RessourceLayout(),
            ActionsLayout(),
          ],
        ),
      ),
    );
  }
}
