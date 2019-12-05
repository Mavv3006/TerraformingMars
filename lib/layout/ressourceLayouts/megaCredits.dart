import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myFloatingActionButton.dart';
import 'package:terraforming_mars/layout/ressourceImage.dart';
import 'package:terraforming_mars/models/observer.dart' ;
import 'package:terraforming_mars/models/ressourceModel.dart';

import '../ressources.dart';

class MegaCredits extends Ressources {
  @override
  Image get image => RessourceImage.getImg('assets/images/megacredits.png');

  @override
  String get name => "MegaCredits";

  @override
  State<StatefulWidget> createState() => _MegaCreditsState();
}

class _MegaCreditsState extends RessourcesState {
  _MegaCreditsState() {
    this.value = RessourceDataModel.megaCredits.value;
    this.production = RessourceDataModel.megaCredits.production;
    Observer.subscribeObserver(this, Observer.nextRound);
  }

  @override
  notify() {
    setState(() {
      this.value = RessourceDataModel.megaCredits.value;
      this.production = RessourceDataModel.megaCredits.production;
    });
  }

  @override
  increaseValue() {
    RessourceDataModel.megaCredits.incrementValue();
    setState(() {
      this.value = RessourceDataModel.megaCredits.value;
    });
  }

  @override
  decreaseValue() {
    RessourceDataModel.megaCredits.decrementValue();
    setState(() {
      this.value = RessourceDataModel.megaCredits.value;
    });
  }

  @override
  increaseProduction() {
    RessourceDataModel.megaCredits.incrementProduction();
    setState(() {
      this.production = RessourceDataModel.megaCredits.production;
    });
  }

  @override
  decreaseProduction() {
    RessourceDataModel.megaCredits.decrementProduction();
    setState(() {
      this.production = RessourceDataModel.megaCredits.production;
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
              child: Text(
                widget.name,
                style: Theme.of(context).textTheme.subhead.apply(
                      fontSizeDelta: 3,
                      fontWeightDelta: 2,
                    ),
              ),
            )
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyFloatingActionButton(
                decreaseProduction,
                Icons.remove,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                ),
                child: Text(
                  "${this.production}",
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),
              ),
              MyFloatingActionButton(
                increaseProduction,
                Icons.add,
              ),
            ],
          ),
        )
      ],
    );
  }
}
