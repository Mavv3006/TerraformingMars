import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/custom_list.dart';
import 'package:terraforming_mars/models/action/terraforming_switch_state.dart';

import 'buy_cards.dart';
import 'play_cards.dart';
import 'standard_projects.dart';
import 'terraforming_actions.dart';

class ActionsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TerraformingSwitchState>(
      create: (_) => TerraformingSwitchState(),
      child: CustomList(
        children: <Widget>[
          PlayCards(),
          BuyCards(),
          TerraformingAction(),
          StandardProjects(),
        ],
      ),
    );
  }
}
