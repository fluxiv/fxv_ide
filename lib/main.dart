import 'package:flutter/material.dart';
import 'package:fxv_ide/views/feed/feed_container.dart';
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
      theme: AppTheme().theme,
      //home: const Welcome(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/sign-in': (context) => const Welcome(),
        '/sign-up': (context) => const Welcome(),
        '/terms': (context) => const Terms(),
        '/feed': (context) => const FeedContainer()
      },
    );
  }
}
