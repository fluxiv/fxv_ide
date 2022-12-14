//import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:fxv_ide/components/form_dynamic_fields.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/services/user_services.dart';
// import 'package:fxv_ide/modals/country.dart';
// import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
    ))]);
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
  var formValues = [];
  int formErrors = 0;
  setFormState(int myBool,String fieldName, dynamic myValue) {
    setState(() {
      var lookIndex = formValues.indexWhere((item) => item.fieldName == fieldName);
      if(lookIndex != -1){
        formValues[lookIndex] = SignUpModels(fieldName: fieldName, value: myValue, errors: myBool);
      } else{
        formValues.add(SignUpModels(fieldName: fieldName, value: myValue, errors: myBool));
      }
      formErrors = formValues.indexWhere((item) => item.errors == 0 || item.errors == 1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                          width: 350.0,
                          child:  FormDynamicFields(
                            fieldName: 'Name',
                            fieldType: 'text',
                            changeFormState: setFormState,
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
                            changeFormState: setFormState,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormDynamicFields(
                            fieldName: 'Birthday',
                            fieldType: 'date',
                            changeFormState: setFormState,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormDynamicFields(
                            fieldName: 'Password',
                            fieldType: 'password',
                            changeFormState: setFormState,
                            showPassArgs: true,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormDynamicFields(
                            fieldName: 'Repeat password',
                            fieldType: 'password',
                            changeFormState: setFormState,
                            showPassArgs: false,
                            formRef: formValues,
                            fieldRef: 'Password'
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
                            onPressed: formErrors == -1  ? () async{
                              var finalValues = {};
                              //var finalValues = UserModels(name: name, birthday: birthday, email: email, password: password);
                              //_formKey.currentState?.save(),
                              for(var value in formValues){
                                if(value.fieldName != 'Repeat password') {
                                  finalValues[value.fieldName] = value.value;
                                }
                              }
                              var response = await UserServices().postUser(finalValues);
                              if(response.statusCode == 201){
                                  final body = json.decode(response.body);
                                  SharedServices().saveString('id', body['id']);
                                  SharedServices().saveString('token', body['token']);
                                  if(mounted){
                                    Navigator.popAndPushNamed(context, '/terms');
                                  }
                              }
                            } : null,
                            // ignore: sort_child_properties_last
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: formErrors != -1 ? const Color(0xff30AAD8) : const Color(0xffffffff)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: formErrors != -1 ? const Color(0xffdbdbdb) :  const Color(0xff30AAD8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
            );
  }
}