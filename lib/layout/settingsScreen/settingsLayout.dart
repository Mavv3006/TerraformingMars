import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list.dart';
import 'package:terraforming_mars/components/custom_scaffold.dart';
import 'package:terraforming_mars/layout/settingsScreen/settings_ressource_value.dart';
import 'package:terraforming_mars/layout/settingsScreen/settings_trade_value.dart';

import 'settings_heat_as_mc.dart';

class SettingsLayout extends StatefulWidget {
  @override
  _SettingsLayoutState createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Einstellungen',
      body: CustomList(
        children: <Widget>[
          SettingsRessourceValue(),
          SettingsTradeValue(),
          SettingsHeatAsMC(),
        ],
      ),
    );
  }
}
