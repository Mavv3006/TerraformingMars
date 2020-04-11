import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

import 'customIcons.dart';

class NextRoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Provider.of<Energy>(context, listen: false).nextRound();
        Provider.of<Crop>(context, listen: false).nextRound();
        Provider.of<Heat>(context, listen: false).nextRound();
        Provider.of<MegaCredits>(context, listen: false).nextRound();
        Provider.of<Titan>(context, listen: false).nextRound();
        Provider.of<Steel>(context, listen: false).nextRound();
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text('Die nächste Runde wurde eingeläutet'),
          ),
        );
        Provider.of<Terraforming>(context, listen: false).nextRound();
      },
      icon: Icon(
        CustomIcons.nextRound,
      ),
    );
  }
}
