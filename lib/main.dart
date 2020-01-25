import 'package:flutter/material.dart';
import 'package:terraforming_mars/layout/mainLayout.dart';
import 'package:terraforming_mars/theme/button.dart';
import 'package:terraforming_mars/theme/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColors.secondaryLight,
        fontFamily: 'Prototype',
//        disabledColor: AppColors.disabledButtonColor,
        buttonTheme: globalButtonTheme,

      ),
      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}
