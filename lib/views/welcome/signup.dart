import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0)),
            elevation: 15,
            child: Container(
                padding: const EdgeInsets.fromLTRB(64, 80, 64, 80),
                child: Form()))
      ],
    );
  }
}

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Sign up',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                fontFamily: 'Heebo',
                height: 0.9)),
        const Text('Welcome!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xff30AAD8),
                fontSize: 15,
                fontFamily: 'Heebo')),
        const SizedBox(
          width: 350,
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt non porttitor hac bibendum nulla dolor. Adipiscing pulvinar ac aliquet ornare. Nulla proin arcu, scelerisque non porttitor lorem.'),
        ),
        Padding(padding: const EdgeInsets.fromLTRB(0, 24, 0, 0)),
      ],
    );
  }
}
