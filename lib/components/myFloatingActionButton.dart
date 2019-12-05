import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final double buttonSize = 30.0;
  final Function() onPressed;
  final IconData icon;

  MyFloatingActionButton(this.onPressed, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      child: RawMaterialButton(
        shape: CircleBorder(),
        fillColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        onPressed: () {
          onPressed();
        },
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
