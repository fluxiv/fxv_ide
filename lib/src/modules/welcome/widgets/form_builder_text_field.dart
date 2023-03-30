import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validators/validators.dart';
import 'package:intl/intl.dart';

// class CustomFormTextField extends StatefulWidget {
//   // const CustomFormTextField({Key? key}) : super(key: key);
//   final String firstname;
//   final String hintText;

//   const CustomFormTextField(
//       {Key? key, required this.firstname, required this.hintText})
//       : super(key: key);

//   @override
//   State<CustomFormTextField> createState() => _CustomFormTextFieldState();
// }

// class _CustomFormTextFieldState extends State<CustomFormTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderTextField(
//       name: ,
//       decoration: const InputDecoration(
//         hintText: "Name",
//         border: OutlineInputBorder(),
//         isDense: true,
//         contentPadding: EdgeInsets.all(15),
//       ),
//       style: const TextStyle(fontSize: 15.0),
//     );
//   }
// }

class CustomFormTextField extends StatelessWidget {
  // const CustomFormTextField({Key? key}) : super(key: key);

  final String firstname;
  final String hintText;
  final bool obscureText;
  final dynamic validator;

  const CustomFormTextField(
      {Key? key,
      required this.firstname,
      required this.hintText,
      required this.obscureText,
      this.validator})
      : super(key: key);

myValidators(value,validator){
  switch (validator){
    case 'email':
      if(isEmail(value)){
        return null;
      } else {
        return 'Enter a valid email';
      }
    case 'password':
      String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp reg = RegExp(pattern);
      if(value.length < 9 || value.length > 36 || !reg.hasMatch(value)){
        return 'Enter a strong password with uppercase, lowercase, number and special characters';
      } else {
        return null;
      }
    default:
      return null;
  }
}

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: firstname,
      obscureText: obscureText,
      validator: (value) {myValidators(value,validator);},
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        isDense: true,
        contentPadding: const EdgeInsets.all(15),
      ),
      style: const TextStyle(fontSize: 15.0),
    );
  }
}
