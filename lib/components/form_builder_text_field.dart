import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

  const CustomFormTextField(
      {Key? key,
      required this.firstname,
      required this.hintText,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: firstname,
      obscureText: obscureText,
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
