import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        primaryColor: const Color(FxvTheme.fxvColor),
        fontFamily: 'Heebo',
        primarySwatch: FxvTheme.blue,
        // textTheme: FxvTheme.fxvTexts,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            )
          )
        ),
        textTheme: FxvTheme.fxvTexts,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(7)),
            borderSide: BorderSide(),
          ),
        ),
      );
}

final ThemeData fxvThemeData = ThemeData(
  primarySwatch: FxvTheme.blue,
);

class FxvTheme {
  FxvTheme._();

  static const fxvColor = 0xff30AAD8;
  static const darkColor = 0xff2C4251;

  static const MaterialColor blue = MaterialColor(fxvColor, <int, Color>{
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
  });

  static const fxvTexts = TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.w800,
        color: Color(0xff000000),
        fontSize: 60,
        fontFamily: 'Heebo',
        height: 0.9),
    headline2: TextStyle(
        fontWeight: FontWeight.w900,
        color: Color(0xff000000),
        fontSize: 48,
        fontFamily: 'Heebo',
        height: 0.9),
    headline3: TextStyle(
        fontWeight: FontWeight.w900,
        color: Color(0xff000000),
        fontSize: 36,
        fontFamily: 'Heebo',
        height: 0.9),
    headline4: TextStyle(
        fontWeight: FontWeight.w900,
        color: Color(fxvColor),
        fontSize: 24,
        fontFamily: 'Heebo'),
    headline5: TextStyle(
        fontWeight: FontWeight.w900,
        color: Color(fxvColor),
        fontSize: 20,
        fontFamily: 'Heebo'),
    headline6: TextStyle(
        fontWeight: FontWeight.w900,
        color: Color(fxvColor),
        fontSize: 15,
        fontFamily: 'Heebo'),
    bodyText1: TextStyle(fontFamily: 'Heebo'),
  );
}
