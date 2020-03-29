import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      providers: [
        ChangeNotifierProvider<History>(
          create: (_) => History(),
        ),
        ChangeNotifierProxyProvider<History, SettingsModel>(
          create: (_) => SettingsModel(),
          update: (_, history, previous) => previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Terraforming>(
          create: (_) => Terraforming(),
          update: (_, history, setting, previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Energy>(
          create: (_) => Energy(),
          update: (_, history, setting, previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Steel>(
          create: (_) => Steel(),
          update: (_, history, setting, previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Titan>(
          create: (_) => Titan(),
          update: (_, history, setting, previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider2<History, SettingsModel, Crop>(
          create: (_) => Crop(),
          update: (_, history, setting, previous) =>
              previous.updateHistory(history).updateSetting(setting),
        ),
        ChangeNotifierProxyProvider3<Energy, History, SettingsModel, Heat>(
          create: (_) => Heat(),
          update: (context, energy, history, setting, previous) => previous
              .updateEnergy(energy)
              .updateHistory(history)
              .updateSetting(setting),
        ),
        ChangeNotifierProxyProvider3<Terraforming, History, SettingsModel,
            MegaCredits>(
          create: (_) => MegaCredits(),
          update: (context, terraformingValue, history, setting, previous) =>
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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}
