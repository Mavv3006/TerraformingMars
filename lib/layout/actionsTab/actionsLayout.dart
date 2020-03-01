import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list.dart';

import 'buy_cards.dart';
import 'play_cards.dart';
import 'standard_projects.dart';
import 'terraforming_actions.dart';

class ActionsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomList(
      children: <Widget>[
        PlayCards(),
        BuyCards(),
        TerraformingAction(),
        StandardProjects(),
      ],
    );
  }
}
