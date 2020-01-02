import 'package:flutter/cupertino.dart';
import 'package:terraforming_mars/components/myColors.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';

class ResLayout extends StatelessWidget {
  final String title;

  const ResLayout(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.lightBackgroundColor,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText("c.V."),
              RessourceValueText(title),
              RessourceValueText("c.V."),
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
