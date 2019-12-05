import 'package:flutter/material.dart';

class RessourceImage {

  static Image getImg(String name) {
    return Image.asset(
      name,
      width: 40,
      height: 50,
    );
  }
}
