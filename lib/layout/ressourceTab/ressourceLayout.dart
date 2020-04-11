import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/custom_list.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

import 'ressourcesView.dart';

class RessourceLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomList(
      children: <Widget>[
        Consumer<MegaCredits>(
            builder: (BuildContext context, MegaCredits data, Widget child) {
          return ResLayout(data);
        }),
        Consumer<Titan>(
            builder: (BuildContext context, Titan data, Widget child) {
          return ResLayout(data);
        }),
        Consumer<Steel>(
            builder: (BuildContext context, Steel data, Widget child) {
          return ResLayout(data);
        }),
        Consumer<Crop>(
            builder: (BuildContext context, Crop data, Widget child) {
          return ResLayout(data);
        }),
        Consumer<Energy>(
            builder: (BuildContext context, Energy data, Widget child) {
          return ResLayout(data);
        }),
        Consumer<Heat>(
            builder: (BuildContext context, Heat data, Widget child) {
          return ResLayout(data);
        }),
        Consumer<Terraforming>(
            builder: (BuildContext context, Terraforming data, Widget child) {
          return Terraforminglayout(data);
        }),
      ],
    );
  }
}
