import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/components/next_round_notification.dart';
import 'package:terraforming_mars/layout/actionsLayout.dart';
import 'package:terraforming_mars/layout/historyLayout.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';
import 'package:terraforming_mars/layout/settingsLayout.dart';
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
            NextRoundButton(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryLayout(),
                  ),
                );
              },
              icon: Icon(
                CustomIcons.history,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsLayout(),
                  ),
                );
              },
              icon: Icon(
                CustomIcons.settings,
              ),
            ),
          ],
          iconTheme: IconThemeData(color: _appBarColor),
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
