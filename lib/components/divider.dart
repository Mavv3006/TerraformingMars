import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  const Seperator({Key key, this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 9,
    );
  }
}
