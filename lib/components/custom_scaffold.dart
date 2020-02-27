import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  final Color _textColor = AppColors.secondaryLight;

  final Widget child;
  final List<Widget> appBarActions;
  final String appBarTitle;

  CustomScaffold({Key key, this.child, this.appBarActions, this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            this.appBarTitle,
            style: Theme
                .of(context)
                .textTheme
                .title
                .copyWith(color: _textColor),
          ),
          actions: this.appBarActions,
          iconTheme: IconThemeData(color: _textColor),
    ),
    backgroundColor: AppColors.backgroundColor,
    body: this.child,
    );
  }
}
