import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/components/next_round_notification.dart';
import 'package:terraforming_mars/layout/actionsTab/actionsLayout.dart';
import 'package:terraforming_mars/layout/historyScreen/historyLayout.dart';
import 'package:terraforming_mars/layout/ressourceTab/ressourceLayout.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'settingsScreen/settingsLayout.dart';

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
            tabs: const <Tab>[
              Tab(text: 'Ressourcen'),
              Tab(text: 'Aktionen'),
            ],
          ),
          title: Text(
            'Terraforming Mars',
            style: Theme.of(context).textTheme.title.copyWith(
                  color: _appBarColor,
                ),
          ),
          actions: <Widget>[
            NextRoundButton(),
            IconButton(
              onPressed: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => HistoryLayout(),
                  ),
                );
              },
              icon: Icon(
                CustomIcons.history,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => SettingsLayout(),
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
