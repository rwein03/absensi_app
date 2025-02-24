// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppStyle {
  final BuildContext context;
  AppStyle(this.context);

  double get heightScreen => MediaQuery.of(context).size.height;
  double get widthScreen => MediaQuery.of(context).size.width;

  static TextStyle titleText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    color: Colors.blue.shade700,
    fontFamily: 'Borel',
    letterSpacing: 7,
  );

  static TextStyle smalltitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w100,
    fontFamily: 'Raleway',
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

  static TextStyle formTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: 'Raleway',
  );

  static BoxDecoration decoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          const Color.fromARGB(1, 170, 170, 170),
          const Color.fromARGB(255, 255, 255, 255),
          const Color.fromARGB(255, 255, 255, 255),
        ],
        begin: const FractionalOffset(0.0, 1.0),
        end: const FractionalOffset(0.0, 0.0),
        stops: [0.0, 1.0, 2.0],
        tileMode: TileMode.clamp),
  );
}
