import 'package:flutter/material.dart';
import 'package:terraforming_mars/models/observer.dart';

import 'terraformingValue.dart';

abstract class Ressources extends TerraformingValue {}

abstract class TerraformingValueState extends State<TerraformingValue> {
  int value = 0;

  increaseValue() {
    setState(() {
      this.value++;
    });
  }

  decreaseValue() {
    if (this.value > 0) {
      setState(() {
        this.value--;
      });
    }
  }
}

abstract class RessourcesState extends TerraformingValueState with Observable {
  int production = 0;

  increaseProduction() {
    setState(() {
      this.production++;
    });
  }

  decreaseProduction() {
    if (this.production > 0) {
      setState(() {
        this.production--;
      });
    }
  }

  nextRound() {
    setState(() {
      this.value += this.production;
    });
  }
}

