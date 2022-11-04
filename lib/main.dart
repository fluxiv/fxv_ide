import 'package:flutter/material.dart';
// import 'package:fxv_ide/views/welcome/signup.dart';
// import 'package:fxv_ide/views/welcome/signin.dart';
// import 'package:fxv_ide/views/welcome/welcome_card.dart';
import 'package:fxv_ide/views/welcome/welcome.dart';
import 'package:fxv_ide/views/terms/terms.dart';
import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluxiv space',
      theme: ThemeData(
        primaryColor: const Color(FxvTheme.fxvColor),
        fontFamily: 'Heebo',
        primarySwatch: FxvTheme.blue,
        textTheme: FxvTheme.fxvTexts,
      ),
      //home: const Welcome(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/sign-in': (context) => const Welcome(),
        '/sign-up': (context) => const Welcome(),
        '/terms': (context) => const Terms()
      },
    );
  }
}
