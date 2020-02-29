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
        Consumer<MegaCredits>(builder: (context, data, child) {
          return ResLayout(data);
        }),
        Consumer<Steel>(builder: (context, data, child) {
          return ResLayout(data);
        }),
        Consumer<Heat>(builder: (context, data, child) {
          return ResLayout(data);
        }),
        Consumer<Energy>(builder: (context, data, child) {
          return ResLayout(data);
        }),
        Consumer<Titan>(builder: (context, data, child) {
          return ResLayout(data);
        }),
        Consumer<Crop>(builder: (context, data, child) {
          return ResLayout(data);
        }),
        Consumer<Terraforming>(builder: (context, data, child) {
          return Terraforminglayout(data);
        }),
      ],
    );
  }
}