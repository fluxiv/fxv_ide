//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:intl/intl.dart';
import 'package:fxv_ide/components/form_builder_text_field.dart';
import 'package:fxv_ide/components/form_dynamic_fields.dart';
// import 'package:fxv_ide/modals/country.dart';
// import 'package:http/http.dart' as http;

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
            // height: 600,
            padding: const EdgeInsets.fromLTRB(45, 45, 45, 40),
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
    )))]);
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool formHasErrors = false;
  void setFormState(myBool) {
    setState(() {
      formHasErrors = myBool;
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
                            formHasErrors: setFormState,
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
                            formHasErrors: setFormState,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormBuilderTextField(
                            name: 'birthday',
                            decoration: const InputDecoration(
                                hintText: "Birthday",
                                border: OutlineInputBorder(),
                                isDense: true,
                                contentPadding: EdgeInsets.all(15)),
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormDynamicFields(
                            fieldName: 'Password',
                            fieldType: 'password',
                            formHasErrors: setFormState,
                            showPassArgs: true,
                          )
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: CustomFormTextField(
                            firstname: 'repPassword',
                            hintText: 'Repeat Password',
                            obscureText: true,


                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: FormBuilderDropdown<String>(
                            name: 'country',
                            decoration: const InputDecoration(
                              hintText: 'Country',
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.all(15),
                            ),
                            items: list.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: ((value) => {}),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 350.0,
                          child: ElevatedButton(
                            onPressed: !formHasErrors ? () => {
                              _formKey.currentState?.save(),
                              print(_formKey.currentState?.value)
                            } : null,
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Color(0xff30AAD8)),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffdbdbdb),
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