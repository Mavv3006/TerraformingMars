import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/layout/actionsLayout.dart';
import 'package:terraforming_mars/layout/ressourceLayout.dart';
import 'package:terraforming_mars/layout/settingsLayout.dart';
import 'package:terraforming_mars/models/ressourceModel.dart';
import 'package:terraforming_mars/my_schedule.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MySchedule(),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Ressourcen",
                  ),
                  Tab(
                    text: "Aktionen",
                  ),
                  Tab(
                    text: "Einstellungen",
                  ),
                ],
              ),
              title: Text("Terraforming Mars"),
            ),
            body: TabBarView(
              children: [
                RessourceLayout(),
                ActionsLayout(),
                SettingsLayout(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                RessourceDataModel.nextRound();
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
