import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myFloatingActionButton.dart';
import 'package:terraforming_mars/layout/ressourceImage.dart';
import 'package:terraforming_mars/models/observer.dart' ;
import 'package:terraforming_mars/models/ressourceModel.dart';

import '../ressources.dart';

class Titanium extends Ressources {
  @override
  Image get image => RessourceImage.getImg('assets/images/titan.png');

  @override
  String get name => "Titan";

  @override
  State<StatefulWidget> createState() => _TitaniumState();
}

class _TitaniumState extends RessourcesState {
  _TitaniumState() {
    this.value = RessourceDataModel.titan.value;
    this.production = RessourceDataModel.titan.production;
    Observer.subscribeObserver(this, Observer.nextRound);
  }

  @override
  notify() {
    setState(() {
      this.value = RessourceDataModel.titan.value;
      this.production = RessourceDataModel.titan.production;
    });
  }

  @override
  increaseValue() {
    RessourceDataModel.titan.incrementValue();
    setState(() {
      this.value = RessourceDataModel.titan.value;
    });
  }

  @override
  decreaseValue() {
    RessourceDataModel.titan.decrementValue();
    setState(() {
      this.value = RessourceDataModel.titan.value;
    });
  }

  @override
  increaseProduction() {
    RessourceDataModel.titan.incrementProduction();
    setState(() {
      this.production = RessourceDataModel.titan.production;
    });
  }

  @override
  decreaseProduction() {
    RessourceDataModel.titan.decrementProduction();
    setState(() {
      this.production = RessourceDataModel.titan.production;
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
