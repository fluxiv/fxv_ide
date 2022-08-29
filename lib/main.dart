import 'package:flutter/material.dart';
import 'package:fxv_ide/views/welcome/signup.dart';
import 'package:fxv_ide/views/welcome/welcome_card.dart';
import 'package:fxv_ide/views/welcome/welcome.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
      initialRoute: '/',
      routes: {'/sign-up': (context) => SignUp()},
    );
  }
}
