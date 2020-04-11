import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:terraforming_mars/layout/mainLayout.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';
import 'package:terraforming_mars/theme/button.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'models/settings/settingsModel.dart';

void main() => runApp(MyProviderApp());

class MyProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<History>(
          create: (_) => History(),
        ),
        ChangeNotifierProxyProvider<History, SettingsModel>(
          create: (_) => SettingsModel(),
          update: (_, History history, SettingsModel previous) =>
              previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Terraforming>(
          create: (_) => Terraforming(),
          update: (_, History history, SettingsModel setting,
                  Terraforming previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Energy>(
          create: (_) => Energy(),
          update:
              (_, History history, SettingsModel setting, Energy previous) =>
                  previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Steel>(
          create: (_) => Steel(),
          update: (_, History history, SettingsModel setting, Steel previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Titan>(
          create: (_) => Titan(),
          update: (_, History history, SettingsModel setting, Titan previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Crop>(
          create: (_) => Crop(),
          update: (_, History history, SettingsModel setting, Crop previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider3<Energy, History, SettingsModel, Heat>(
          create: (_) => Heat(),
          update: (
            BuildContext context,
            Energy energy,
            History history,
            SettingsModel setting,
            Heat previous,
          ) =>
              previous
                  .updateEnergy(energy)
                  .updateHistory(history)
                  .updateSetting(setting),
        ),
        ChangeNotifierProxyProvider3<Terraforming, History, SettingsModel,
            MegaCredits>(
          create: (_) => MegaCredits(),
          update: (
            BuildContext context,
            Terraforming terraformingValue,
            History history,
            SettingsModel setting,
            MegaCredits previous,
          ) =>
              previous
                  .updateTerraformingValue(terraformingValue)
                  .updateHistory(history)
                  .updateSetting(setting),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColors.secondaryLight,
        primaryColor: AppColors.accentColor,
        fontFamily: 'Prototype',
        buttonTheme: globalButtonTheme,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
//      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}
