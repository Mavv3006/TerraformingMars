import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';
import 'package:terraforming_mars/theme/colors.dart';

class SettingsLayout extends StatelessWidget {
  final Color _textColor = AppColors.secondaryLight;
  final SettingsModel settingsModel;
  final Heat heat;

  const SettingsLayout({
    Key key,
    /*@required*/ this.settingsModel, this.heat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Einstellungen",
          style: Theme.of(context).textTheme.title.copyWith(color: _textColor),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(Provider.of<Heat>(context).title),
      ),
    );
  }
}
