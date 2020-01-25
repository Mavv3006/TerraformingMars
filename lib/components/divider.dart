import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  final double height;

  const Seperator({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height ?? 9,
    );
  }
}
