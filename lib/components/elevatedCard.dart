import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final Widget child;
  final double elevation;

  ElevatedCard({Key key, this.child, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: this.elevation ?? 15,
      color: Colors.transparent,
      child: child,
    );
  }
}
