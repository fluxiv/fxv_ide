import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:fxv_ide/components/form_builder_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.0),
          ),
          elevation: 15,
          child: Container(
            padding: const EdgeInsets.fromLTRB(45, 70, 30, 40),
            child: const MyFormLogin(),
          ),
        )
      ],
    );
  }
}

class MyFormLogin extends StatefulWidget {
  const MyFormLogin({Key? key}) : super(key: key);

  @override
  State<MyFormLogin> createState() => _MyFormLoginState();
}

class _MyFormLoginState extends State<MyFormLogin> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Sign In',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
              fontFamily: 'Heebo',
              height: 0.9),
        ),
        const Text(
          'Great to see you here!',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xff30AAD8),
              fontSize: 15,
              fontFamily: 'Heebo'),
        ),
        const SizedBox(height: 25.0),
        const SizedBox(
          width: 350,
          child: Text(
              'Welcome back to Fluxiv! Remember here as your place to talk, make friends, share yout thoughts and ideas about our passion, the Open Source world! Together we build great things!'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
        ),
        SizedBox(
          height: 245,
          width: 365,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: CustomFormTextField(
                            firstname: 'email',
                            hintText: 'Email',
                            obscureText: false,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: CustomFormTextField(
                            firstname: 'password',
                            hintText: 'Password',
                            obscureText: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: ElevatedButton(
                            onPressed: () => {
                              _formKey.currentState?.save(),
                              print(_formKey.currentState?.value)
                            },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color(0xffdbdbdb),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff30AAD8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
