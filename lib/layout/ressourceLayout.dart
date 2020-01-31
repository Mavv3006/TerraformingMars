import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/layout/ressourceLayout/energyLayout.dart';
import 'package:terraforming_mars/layout/ressourceLayout/resLayout.dart';
import 'package:terraforming_mars/layout/ressourceLayout/terraformingLayout.dart';
import 'package:terraforming_mars/models/ressourceDataModel.dart';
import 'package:terraforming_mars/models/terraformingValueData.dart';
import 'package:terraforming_mars/theme/colors.dart';

class RessourceLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return <Widget>[
            Consumer<MegaCredits>(builder: (context, data, child) {
              return ResLayout(data);
            }),
            Consumer<Steel>(builder: (context, data, child) {
              return ResLayout(data);
            }),
            Consumer<Heat>(builder: (context, data, child) {
              return ResLayout(data);
            }),
            Consumer<RessourceDataModel>(builder: (context, dataModel, child) {
              return EnergyLayout();
            }),
            Consumer<Titan>(builder: (context, data, child) {
              return ResLayout(data);
            }),
            Consumer<Crop>(builder: (context, data, child) {
              return ResLayout(data);
            }),
            Consumer<RessourceDataModel>(builder: (context, dataModel, child) {
              return Terraforminglayout(dataModel);
            }),
          ][index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.transparent);
        },
        itemCount: 7);
  }
}
