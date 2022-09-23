import 'package:flutter/material.dart';
import 'package:fxv_ide/views/welcome/signup.dart';
import 'package:fxv_ide/views/welcome/signin.dart';
import 'package:fxv_ide/views/welcome/welcome_card.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomePage();
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        toolbarTextStyle: const TextStyle(color: Color(0xff000000)),
        backgroundColor: const Color(0xffffffff),
        // title: SizedBox(
        //   width: 100,
        //   child: Image.asset("logo/fxvLogo.png"),
        // ),
        automaticallyImplyLeading: false,
        actions: const [Actions()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          // child: WelcomeCard(),
          child: Navigator(
            reportsRouteUpdateToEngine: true,
            onGenerateRoute: ((settings) {
              Widget page = const WelcomeCard();
              switch (settings.name) {
                case '/':
                  page = const WelcomeCard();
                  break;
                case '/sign-up':
                  page = const SignUp();
                  break;
                case '/sign-in':
                  page = const SignIn();
                  break;
              }

              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => page,
                settings: settings,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end);
                  final offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 950.0),
            child: IconButton(
              iconSize: 100,
              onPressed: () => Navigator.pushNamed(context, '/'),
              icon: SizedBox(
                width: 100,
                child: Image.asset(
                  "assets/logo/fxvLogo.png",
                ),
              ),
            )),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text('About'),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text('Services'),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text('Phylosophy'),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            'Privacy',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
