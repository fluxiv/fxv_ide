import 'package:flutter/material.dart';

final ThemeData fxvThemeData = ThemeData(
    primarySwatch: FxvTheme.blue,
);

class FxvTheme {
  FxvTheme._();

  static const fxvColor =  0xff30AAD8;
  
  static const MaterialColor blue = MaterialColor(
    fxvColor,
    <int,Color> {
      50: Color(0xffdff2f9),
      100: Color(0xffaedef0),
      200: Color(0xff79c9e6),
      300: Color(fxvColor),
      400: Color(0xff16a5d7),
      500: Color(0xff0096d3),
      600: Color(0xff0089c5),
      700: Color(0xff0077b3),
      800: Color(0xff0067a0),
      900: Color(0xff004880),
    }
  );

  static const fxvTexts = TextTheme(
    headline1: TextStyle(fontFamily: 'Heebo',fontSize: 96),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(),
    headline6: TextStyle(),
    bodyText1: TextStyle(),
  );
}