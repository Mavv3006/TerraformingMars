import 'package:flutter/material.dart';
import 'package:terraforming_mars/layout/ressourceLayout/resLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';

class RessourceLayout extends StatelessWidget {
  static RessourceDataModel dataModel = new RessourceDataModel();
  final List<ResLayout> _layoutList = [
    ResLayout(dataModel.megaCredits),
    ResLayout(dataModel.megaCredits),
    ResLayout(dataModel.megaCredits),
    ResLayout(dataModel.megaCredits),
    ResLayout(dataModel.steel),
    ResLayout(dataModel.steel),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _layoutList[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: _layoutList.length),
    );
  }
}
