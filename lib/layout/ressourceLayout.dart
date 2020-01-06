import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/divider.dart';
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
    ResLayout(dataModel.megaCredits),
    ResLayout(dataModel.megaCredits),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _layoutList[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return Seperator();
      },
      itemCount: _layoutList.length,
    );
  }
}
