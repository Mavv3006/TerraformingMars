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
        ChangeNotifierProvider<SettingsModel>(
          create: (_) => SettingsModel(),
        ),
        ChangeNotifierProvider<Terraforming>(
          create: (_) => Terraforming(),
        ),
        ChangeNotifierProvider<Energy>(
          create: (_) => Energy(),
        ),
        ChangeNotifierProvider<Steel>(
          create: (_) => Steel(),
        ),
        ChangeNotifierProvider<Titan>(
          create: (_) => Titan(),
        ),
        ChangeNotifierProvider<Crop>(
          create: (_) => Crop(),
        ),
        ChangeNotifierProxyProvider<Energy, Heat>(
          create: (_) => Heat(),
          update: (context, energy, previous) => previous.updateEnergy(energy),
        ),
        ChangeNotifierProxyProvider<Terraforming, MegaCredits>(
          create: (_) => MegaCredits(),
          update: (context, terraformingValue, previous) =>
              previous.updateTerraformingValue(terraformingValue),
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
