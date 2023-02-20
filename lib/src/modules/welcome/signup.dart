//import 'dart:convert';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:fxv_ide/src/models/user_models.dart';
import 'package:fxv_ide/src/modules/welcome/controller/welcome_controller.dart';
import 'package:fxv_ide/src/modules/welcome/widgets/form_dynamic_fields.dart';
import 'package:fxv_ide/src/services/shared_services.dart';
import 'package:fxv_ide/src/services/user_services.dart';
import 'package:provider/provider.dart';
// import 'package:fxv_ide/modals/country.dart';
// import 'package:http/http.dart' as http;

class SignUpIntent extends Intent {}

var signUpNode = FocusNode();

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        signUpNode.requestFocus();
      },
      child: Row(children: [
        Container(
            // height: 600,
            padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 60,
                      fontFamily: 'Heebo',
                      height: 0.9),
                ),
                Text(
                  'Welcome!',
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt non porttitor hac bibendum nulla dolor. Adipiscing pulvinar ac aliquet ornare. Nulla proin arcu, scelerisque non porttitor lorem.'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                ),
                SizedBox(
                  height: 245,
                  width: 365,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: MyForm(),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

// class FormStateModel{
//   String value;
//   bool errors;
// }
class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  //List changeFormState = [];
  // var formValues = [];
  // int formErrors = 0;
  // setFormState(int myBool, String fieldName, dynamic myValue) {
  //   setState(() {
  //     var lookIndex =
  //         formValues.indexWhere((item) => item.fieldName == fieldName);
  //     if (lookIndex != -1) {
  //       formValues[lookIndex] =
  //           SignUpModels(fieldName: fieldName, value: myValue, errors: myBool);
  //     } else {
  //       formValues.add(
  //           SignUpModels(fieldName: fieldName, value: myValue, errors: myBool));
  //     }
  //     formErrors =
  //         formValues.indexWhere((item) => item.errors == 0 || item.errors == 1);
  //   });
  // }

  // signUp() async {
  //   var finalValues = {};
  //   // var finalValues = UserModels(name: name, birthday: birthday, email: email, password: password);
  //   //_formKey.currentState?.save(),
  //   for (var value in formValues) {
  //     if (value.fieldName != 'Repeat password') {
  //       finalValues[value.fieldName] = value.value;
  //     }
  //   }
  //   print(finalValues);
  //   var response = await UserServices().postUser(finalValues);
  //   print(response);
  //   if (response.statusCode == 201) {
  //     final body = json.decode(response.body);
  //     SharedServices().saveString('id', body['id']);
  //     SharedServices().saveString('token', body['token']);
  //     if (mounted) {
  //       Navigator.popAndPushNamed(context, '/terms');
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    final controller = context.read<WelcomeController>();
    controller.addListener(() {
      if (controller.state == SignUpState.sucess) {
        Navigator.popAndPushNamed(context, '/terms');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _welcomeController = context.watch<WelcomeController>();

    return Shortcuts(
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.enter): SignUpIntent()},
      child: Actions(
        actions: {
          SignUpIntent: CallbackAction<SignUpIntent>(onInvoke: (intent) {
            if (_welcomeController.formErrors == -1) {
              _welcomeController.signUp();
            }
          })
        },
        child: Focus(
          autofocus: true,
          focusNode: signUpNode,
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: 350.0,
                      child: FormDynamicFields(
                        fieldName: 'Name',
                        fieldType: 'text',
                        changeFormState: _welcomeController.setFormState,
                        externNode: signUpNode,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                        width: 350.0,
                        child: FormDynamicFields(
                          fieldName: 'Email',
                          fieldType: 'email',
                          changeFormState: _welcomeController.setFormState,
                          externNode: signUpNode,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                        width: 350.0,
                        child: FormDynamicFields(
                          fieldName: 'Birthday',
                          fieldType: 'date',
                          changeFormState: _welcomeController.setFormState,
                          externNode: signUpNode,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                        width: 350.0,
                        child: FormDynamicFields(
                          fieldName: 'Password',
                          fieldType: 'password',
                          changeFormState: _welcomeController.setFormState,
                          showPassArgs: true,
                          externNode: signUpNode,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: 350.0,
                      child: FormDynamicFields(
                        fieldName: 'Repeat password',
                        fieldType: 'password',
                        changeFormState: _welcomeController.setFormState,
                        showPassArgs: false,
                        formRef: _welcomeController.formValues,
                        fieldRef: 'Password',
                        externNode: signUpNode,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 16),
                  //   child: SizedBox(
                  //     width: 350.0,
                  //     child: FormBuilderDropdown<String>(
                  //       name: 'country',
                  //       decoration: const InputDecoration(
                  //         hintText: 'Country',
                  //         border: OutlineInputBorder(),
                  //         isDense: true,
                  //         contentPadding: EdgeInsets.all(15),
                  //       ),
                  //       items: list.map<DropdownMenuItem<String>>(
                  //         (String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         },
                  //       ).toList(),
                  //       onChanged: ((value) => {}),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: 350.0,
                      child: ElevatedButton(
                        onPressed: _welcomeController.formErrors == -1
                            ? () async {
                                var finalValues = {};
                                // var finalValues = UserModels(name: name, birthday: birthday, email: email, password: password);
                                //_formKey.currentState?.save(),
                                for (var value
                                    in _welcomeController.formValues) {
                                  if (value.fieldName != 'Repeat password') {
                                    finalValues[value.fieldName] = value.value;
                                  }
                                }
                                print(finalValues);
                                var response =
                                    await UserServices().postUser(finalValues);
                                print(response);
                                if (response.statusCode == 201) {
                                  final body = json.decode(response.body);
                                  SharedServices().saveString('id', body['id']);
                                  SharedServices()
                                      .saveString('token', body['token']);
                                  if (mounted) {
                                    Navigator.popAndPushNamed(
                                        context, '/terms');
                                  }
                                }
                              }
                            : null,
                        // ignore: sort_child_properties_last
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: _welcomeController.formErrors != -1
                                  ? const Color(0xff30AAD8)
                                  : const Color(0xffffffff)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _welcomeController.formErrors != -1
                              ? const Color(0xffdbdbdb)
                              : const Color(0xff30AAD8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
