import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({Key key, this.body, this.appBarActions, this.appBarTitle})
      : super(key: key);

  final Color _textColor = AppColors.secondaryLight;
  final Widget body;
  final List<Widget> appBarActions;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: Theme.of(context).textTheme.title.copyWith(color: _textColor),
        ),
        actions: appBarActions,
        iconTheme: IconThemeData(color: _textColor),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: body,
    );
  }
}
