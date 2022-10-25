import 'package:flutter/material.dart';
import 'package:fxv_ide/components/form_dynamic_fields.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
           Container(
            padding: const EdgeInsets.fromLTRB(45, 70, 30, 40),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
            Text(
            'Sign In',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            fontFamily: 'Heebo',
            height: 0.9),
            ),
            Text(
            'Great to see you here!',
            style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xff30AAD8),
            fontSize: 15,
            fontFamily: 'Heebo'),
            ),
            SizedBox(height: 25.0),
            SizedBox(
              width: 350,
              child: Text(
              'Welcome back to Fluxiv! Remember here as your place to talk, make friends, share yout thoughts and ideas about our passion, the Open Source world! Together we build great things!'),
            ),
            Padding(
            padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
            ),
            SizedBox(
            height: 245,
            width: 365,
            child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: MyFormLogin(),
                  ))],))
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
  final _formKey = GlobalKey<FormState>();
  bool changeFormState = false;
  var formValues = {};
  setFormState(bool myBool,String fieldName, myValue) {
    setState(() {
      changeFormState = myBool;
      if(myBool){
        formValues[fieldName] = {'value':myValue,'errors': true};
      } else{
        formValues[fieldName] = {'value':myValue,'errors': false};
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormDynamicFields(
                            fieldType: 'email',
                            fieldName: 'Email',
                            changeFormState: setFormState,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormDynamicFields(
                            fieldType: 'password',
                            fieldName: 'Password',
                            changeFormState: setFormState,
                            showPassArgs: false,

                          )
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 16),
                      //   child: Text('Forgot your password? click here!',style: TextStyle(),),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: ElevatedButton(
                            onPressed: () => {
                              null
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
                      ),

                    ],
                  )
                ],
              ),
            );
  }
}
