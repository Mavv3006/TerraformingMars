import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myFloatingActionButton.dart';
import 'package:terraforming_mars/layout/ressourceImage.dart';
import 'package:terraforming_mars/models/ressourceModel.dart';

import 'ressources.dart';

class TerraformingValue extends StatefulWidget {
  final Image image = RessourceImage.getImg('assets/images/tfw.png');
  final String name = "Terraforming-";

  @override
  State<StatefulWidget> createState() => _TerraformingValueState();
}

class _TerraformingValueState extends TerraformingValueState {
  _TerraformingValueState() {
    this.value = RessourceDataModel.terraformingValue.value;
  }

  @override
  increaseValue() {
    RessourceDataModel.terraformingValue.incrementValue();
    setState(() {
      this.value = RessourceDataModel.terraformingValue.value;
    });
  }

  @override
  decreaseValue() {
    RessourceDataModel.terraformingValue.decrementValue();
    setState(() {
      this.value = RessourceDataModel.terraformingValue.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.image,
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.subhead.apply(
                          fontSizeDelta: 3,
                          fontWeightDelta: 2,
                        ),
                  ),
                  Text(
                    "Wert",
                    style: Theme.of(context).textTheme.subhead.apply(
                          fontSizeDelta: 3,
                          fontWeightDelta: 2,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyFloatingActionButton(
              decreaseValue,
              Icons.remove,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 18.0,
              ),
              child: Text(
                "${this.value}",
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.center,
              ),
            ),
            MyFloatingActionButton(
              increaseValue,
              Icons.add,
            ),
          ],
        )
      ],
    );
  }
}
