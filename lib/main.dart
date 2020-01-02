import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myColors.dart';
import 'package:terraforming_mars/layout/inheritedLayout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Prototype',
        buttonColor: MyColors.lightAccentColor,
        disabledColor: MyColors.disabledButtonColor,
      ),
      debugShowCheckedModeBanner: false,
      home: InheritedLayout(),
    );
  }
}
