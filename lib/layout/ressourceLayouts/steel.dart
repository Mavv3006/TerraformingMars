import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myFloatingActionButton.dart';
import 'package:terraforming_mars/layout/ressourceImage.dart';
import 'package:terraforming_mars/models/observer.dart' ;
import 'package:terraforming_mars/models/ressourceModel.dart';

import '../ressources.dart';

class Steel extends Ressources {
  @override
  Image get image => RessourceImage.getImg('assets/images/stahl.png');

  @override
  String get name => "Stahl";

  @override
  State<StatefulWidget> createState() => _SteelState();
}

class _SteelState extends RessourcesState {
  _SteelState() {
    this.value = RessourceDataModel.steel.value;
    this.production = RessourceDataModel.steel.production;
    Observer.subscribeObserver(this, Observer.nextRound);
  }

  @override
  notify() {
    setState(() {
      this.value = RessourceDataModel.steel.value;
      this.production = RessourceDataModel.steel.production;
    });
  }

  @override
  increaseValue() {
    RessourceDataModel.steel.incrementValue();
    setState(() {
      this.value = RessourceDataModel.steel.value;
    });
  }

  @override
  decreaseValue() {
    RessourceDataModel.steel.decrementValue();
    setState(() {
      this.value = RessourceDataModel.steel.value;
    });
  }

  @override
  increaseProduction() {
    RessourceDataModel.steel.incrementProduction();
    setState(() {
      this.production = RessourceDataModel.steel.production;
    });
  }

  @override
  decreaseProduction() {
    RessourceDataModel.steel.decrementProduction();
    setState(() {
      this.production = RessourceDataModel.steel.production;
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
