import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/layout/mainLayout.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';
import 'package:terraforming_mars/theme/button.dart';
import 'package:terraforming_mars/theme/colors.dart';

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
        ChangeNotifierProxyProvider<History, Terraforming>(
          create: (_) => Terraforming(),
          update: (_, history, previous) => previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider<History, Energy>(
          create: (_) => Energy(),
          update: (_, history, previous) => previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider<History, Steel>(
          create: (_) => Steel(),
          update: (_, history, previous) => previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider<History, Titan>(
          create: (_) => Titan(),
          update: (_, history, previous) => previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider<History, Crop>(
          create: (_) => Crop(),
          update: (_, history, previous) => previous.updateHistory(history),
        ),
        ChangeNotifierProxyProvider2<Energy, History, Heat>(
          create: (_) => Heat(),
          update: (context, energy, history, previous) =>
              previous.updateEnergy(energy).updateHistory(history),
        ),
        ChangeNotifierProxyProvider2<Terraforming, History, MegaCredits>(
          create: (_) => MegaCredits(),
          update: (context, terraformingValue, history, previous) => previous
              .updateTerraformingValue(terraformingValue)
              .updateHistory(history),
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
