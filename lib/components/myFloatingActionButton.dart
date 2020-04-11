import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton(this.onPressed, this.icon);

  final Function() onPressed;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      child: RawMaterialButton(
        shape: const CircleBorder(),
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
