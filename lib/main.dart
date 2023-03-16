import 'package:flutter/material.dart';
import 'package:fxv_ide/src/modules/feed/controllers/feed_controller.dart';
import 'package:fxv_ide/src/modules/feed/feed_container.dart';
import 'package:fxv_ide/src/modules/terms/terms.dart';
import 'package:fxv_ide/src/modules/welcome/controller/welcome_controller.dart';
import 'package:fxv_ide/src/modules/welcome/welcome.dart';
import 'package:provider/provider.dart';
import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WelcomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FeedController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fluxiv space',
        theme: AppTheme().theme,
        //home: const Welcome(),
        initialRoute: '/',
        routes: {
          // '/': (context) => const FeedContainer(),
          '/': (context) => const FeedContainer(),
          '/sign-in': (context) => const Welcome(),
          '/sign-up': (context) => const Welcome(),
          '/terms': (context) => const Terms(),
          '/feed': (context) => const FeedContainer()
        },
      ),
    );
  }
}
