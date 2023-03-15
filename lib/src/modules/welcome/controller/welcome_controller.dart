import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fxv_ide/src/models/user_models.dart';
import 'package:fxv_ide/src/services/shared_services.dart';
import 'package:fxv_ide/src/services/user_services.dart';

enum SignUpState { idle, sucess, error, loading }

class WelcomeController extends ChangeNotifier {
  var formValues = [];
  int formErrors = 0;
  var state = SignUpState.idle;

  setFormState(int myBool, String fieldName, dynamic myValue) {
    var lookIndex =
        formValues.indexWhere((item) => item.fieldName == fieldName);
    if (lookIndex != -1) {
      formValues[lookIndex] =
          SignUpModels(fieldName: fieldName, value: myValue, errors: myBool);
    } else {
      formValues.add(
          SignUpModels(fieldName: fieldName, value: myValue, errors: myBool));
    }
    formErrors =
        formValues.indexWhere((item) => item.errors == 0 || item.errors == 1);
    notifyListeners();
  }

  signUp() async {
    var finalValues = {};
    // var finalValues = UserModels(name: name, birthday: birthday, email: email, password: password);
    //_formKey.currentState?.save(),
    for (var value in formValues) {
      if (value.fieldName != 'Repeat password') {
        finalValues[value.fieldName] = value.value;
      }
    }
    print(finalValues);
    try {
      var response = await UserServices().postUser(finalValues);
      print(response);
      if (response.statusCode == 201) {
        final body = json.decode(response.body);
        SharedServices().saveString('id', body['id']);
        SharedServices().saveString('token', body['token']);
        state = SignUpState.sucess;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      state = SignUpState.error;
    }
  }
}
