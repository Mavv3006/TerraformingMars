import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/layout/mainLayout.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/theme/button.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'models/ressourceDataModel.dart';
import 'models/terraformingValueData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColors.secondaryLight,
        primaryColor: AppColors.accentColor,
        fontFamily: 'Prototype',
        buttonTheme: globalButtonTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        Provider<SettingsModel>(
          create: (context) => SettingsModel(),
        ),
        ChangeNotifierProvider<RessourceDataModel>(
          create: (_) => RessourceDataModel(),
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
        ChangeNotifierProvider<Heat>(
          create: (_) => Heat(RessourceDataModel.energy),
        ),
        ChangeNotifierProvider<MegaCredits>(
          create: (_) => MegaCredits(RessourceDataModel.terraFormingValue),
        ),
      ], child: MainLayout()),
    );
  }
}
