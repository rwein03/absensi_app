import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle titleText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    color: Colors.blue.shade700,
    fontFamily: 'Borel',
    letterSpacing: 7,
  );

  static TextStyle subTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    fontFamily: 'Raleway',
  );

  static TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w900,
    fontFamily: 'Raleway',
  );

  static BoxDecoration decoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          const Color.fromARGB(255, 68, 138, 255),
          const Color.fromARGB(255, 255, 255, 255),
          const Color.fromARGB(255, 255, 255, 255),
        ],
        begin: const FractionalOffset(0.0, 1.0),
        end: const FractionalOffset(0.0, 0.0),
        stops: [0.0, 1.0, 2.0],
        tileMode: TileMode.clamp),
  );
}
