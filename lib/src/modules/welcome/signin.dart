import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fxv_ide/src/models/user_models.dart';
import 'package:fxv_ide/src/modules/welcome/widgets/form_dynamic_fields.dart';
import 'package:fxv_ide/src/services/shared_services.dart';
import 'package:fxv_ide/src/services/user_services.dart';

class LoginIntent extends Intent {}

var focusNode = FocusNode();

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        focusNode.requestFocus();
      },
      child: Row(
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
                    ))
              ],
            ),
          )
        ],
      ),
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
  int changeFormState = 0;
  var formValues = [];
  int formErrors = 0;
  setFormState(int myInt, String fieldName, myValue) {
    setState(() {
      changeFormState = myInt;
      var lookIndex =
          formValues.indexWhere((item) => item.fieldName == fieldName);
      if (lookIndex != -1) {
        formValues[lookIndex] =
            SignUpModels(fieldName: fieldName, value: myValue, errors: myInt);
      } else {
        formValues.add(
            SignUpModels(fieldName: fieldName, value: myValue, errors: myInt));
      }
      formErrors =
          formValues.indexWhere((item) => item.errors == 0 || item.errors == 1);
    });
  }

  Login() async {
    //print('TESTEKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKHIHIHI');
    // focusNode.hasFocus;
    var finalValues = {};
    //var finalValues = UserModels(name: name, birthday: birthday, email: email, password: password);
    //_formKey.currentState?.save(),
    for (var value in formValues) {
      finalValues[value.fieldName] = value.value.trim();
    }
    var response = await UserServices().loginUser(finalValues);
    //print(response);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      var userModels = UserModels(
          id: body['data']['id'],
          name: body['data']['name'],
          birthday: body['data']['birthday'],
          email: body['data']['email'],
          isPremium: body['data']['isPremium'],
          terms: body['data']['terms']);
      String token = body['token'];
      SharedServices().saveString('id', userModels.id);
      SharedServices().saveString('token', token);
      if (userModels.terms == 0) {
        if (mounted) {
          SharedServices().eraseAndGoTo(context, '/terms');
        }
      } else {
        if (mounted) {
          SharedServices().goWithParams(context, '/feed', userModels.id);
        }
      }

      // await prefs.setString('id', response.body['id']);
      // await prefs.setString('token', response.body['token']);
    } else {
      final body = json.decode(response.body);
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            "Error!",
            style: TextStyle(fontSize: 24),
          ),
          content: Text(body["msg"]),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, "Ok"),
                child: const Text(
                  "Ok",
                  style: TextStyle(color: Color(0xffffffff)),
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.enter): LoginIntent()},
      child: Actions(
        actions: {
          LoginIntent: CallbackAction<LoginIntent>(onInvoke: (intent) {
            Login();
          })
        },
        child: Focus(
          autofocus: true,
          focusNode: focusNode,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                      width: 350.0,
                      child: FormDynamicFields(
                        fieldType: 'email',
                        fieldName: 'Email',
                        changeFormState: setFormState,
                        // functionLogin: Login,
                        externNode: focusNode,
                      )),
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
                        externNode: focusNode,
                      )),
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 16),
                //   child: Text('Forgot your password? click here!',style: TextStyle(),),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    // height: 100,
                    width: 350.0,
                    child: ElevatedButton(
                      onFocusChange: (value) {},
                      onPressed: () {
                        Login();
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xffdbdbdb),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff30AAD8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  // return Form(
  //   key: _formKey,
  //   child: Column(
  //     children: <Widget>[
  //       Column(
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 16),
  //             child: SizedBox(
  //                 width: 350.0,
  //                 child: FormDynamicFields(
  //                   fieldType: 'email',
  //                   fieldName: 'Email',
  //                   changeFormState: setFormState,
  //                 )),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 16),
  //             child: SizedBox(
  //                 width: 350.0,
  //                 child: FormDynamicFields(
  //                   fieldType: 'password',
  //                   fieldName: 'Password',
  //                   changeFormState: setFormState,
  //                   showPassArgs: false,
  //                 )),
  //           ),
  //           // Padding(
  //           //   padding: EdgeInsets.only(bottom: 16),
  //           //   child: Text('Forgot your password? click here!',style: TextStyle(),),
  //           // ),

  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 16),
  //             child: SizedBox(
  //               width: 350.0,
  //               child: ElevatedButton(
  //                 focusNode: focusNode,
  //                 onFocusChange: (value) {},
  //                 onPressed: () async {
  //                   var finalValues = {};
  //                   //var finalValues = UserModels(name: name, birthday: birthday, email: email, password: password);
  //                   //_formKey.currentState?.save(),
  //                   for (var value in formValues) {
  //                     finalValues[value.fieldName] = value.value;
  //                   }
  //                   var response =
  //                       await UserServices().loginUser(finalValues);
  //                   print(response);
  //                   if (response.statusCode == 200) {
  //                     final body = json.decode(response.body);
  //                     var userModels = UserModels(
  //                         id: body['data']['id'],
  //                         name: body['data']['name'],
  //                         birthday: body['data']['birthday'],
  //                         email: body['data']['email'],
  //                         isPremium: body['data']['isPremium'],
  //                         terms: body['data']['terms']);
  //                     String token = body['token'];
  //                     SharedServices().saveString('id', userModels.id);
  //                     SharedServices().saveString('token', token);
  //                     if (userModels.terms == 0) {
  //                       if (mounted) {
  //                         SharedServices().eraseAndGoTo(context, '/terms');
  //                       }
  //                     } else {
  //                       if (mounted) {
  //                         Timer(
  //                             Duration(seconds: 1),
  //                             () => {
  //                                   SharedServices()
  //                                       .eraseAndGoTo(context, '/feed')
  //                                 });
  //                       }
  //                     }

  //                     // await prefs.setString('id', response.body['id']);
  //                     // await prefs.setString('token', response.body['token']);
  //                   } else {
  //                     final body = json.decode(response.body);
  //                     showDialog(
  //                         context: context,
  //                         builder: (BuildContext context) => AlertDialog(
  //                               title: const Text(
  //                                 "Error!",
  //                                 style: TextStyle(fontSize: 24),
  //                               ),
  //                               content: Text(body["msg"]),
  //                               actions: [
  //                                 ElevatedButton(
  //                                     onPressed: () =>
  //                                         Navigator.pop(context, "Ok"),
  //                                     child: const Text(
  //                                       "Ok",
  //                                       style: TextStyle(
  //                                           color: Color(0xffffffff)),
  //                                     ))
  //                               ],
  //                             ));
  //                   }
  //                 },
  //                 // ignore: sort_child_properties_last
  //                 child: const Text(
  //                   'Sign In',
  //                   style: TextStyle(
  //                     color: Color(0xffdbdbdb),
  //                   ),
  //                 ),
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: const Color(0xff30AAD8),
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 50, vertical: 20),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       )
  //     ],
  //   ),
  // );
}
