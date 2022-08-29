import 'package:flutter/material.dart';
import './login.dart';
import './signup.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarTextStyle: const TextStyle(color: Color(0xff000000)),
        backgroundColor: const Color(0xffffffff),
        title: SizedBox(
          width: 100,
          child: Image.asset("logo/fxvLogo.png"),
        ),
        actions: const [Actions()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Navigator(
            onGenerateRoute: (settings) {
              Widget page = const Login();
              switch (settings.name) {
                case '/':
                  page = const Login();
                  break;
                case '/sign-up':
                  page = const SignUp();
                  break;
              }

              return PageRouteBuilder(pageBuilder: (_, __, ___) => page);
            },
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
    // TODO: implement build
    return Flex(
      direction: Axis.horizontal,
      children: const <Widget>[
        Padding(padding: EdgeInsets.only(right: 20.0), child: Text('About')),
        Padding(padding: EdgeInsets.only(right: 20.0), child: Text('Services')),
        Padding(
            padding: EdgeInsets.only(right: 20.0), child: Text('Phylosophy')),
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              'Privacy',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
