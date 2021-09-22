import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonColor: Colors.blue,
  );
  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    ),
    scaffoldBackgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    backgroundColor: Color.fromRGBO(64, 75, 96, .9),
    canvasColor: Color.fromRGBO(58, 66, 86, 1.0),
    buttonColor: Colors.red,
  );
}