import 'package:flutter/material.dart';
import 'package:terraforming_mars/layout/ressourceLayout/resLayout.dart';

class RessourceLayout extends StatelessWidget {
  final List<ResLayout> _layoutList = [
    ResLayout("Megacredits"),
    ResLayout("Megacredits"),
    ResLayout("Megacredits"),
    ResLayout("Megacredits"),
    ResLayout("Megacredits"),
    ResLayout("Megacredits"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _layoutList[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: _layoutList.length);
  }
}
