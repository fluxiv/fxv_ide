import 'package:flutter/rendering.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter/material.dart';

// class FormInputDecoration extends StatefulWidget {
//   final String fieldType;
//   final String fieldName;
//   final bool error;
//   const FormInputDecoration(
//       {super.key,
//       required this.fieldType,
//       required this.fieldName,
//       required this.error});

//   dynamic myInput() {
//     switch (this.fieldType) {
//       case 'text':
//         return InputDecoration(
//           hintStyle: this.error
//               ? const TextStyle(
//                   color: Color(0xffff0022), fontWeight: FontWeight.bold)
//               : null,
//           hintText:
//               !this.error ? this.fieldName : '${this.fieldName} is invalid',
//           suffixIcon: this.error
//               ? const Icon(Icons.warning_rounded, color: Color(0xffff0022))
//               : null,
//           enabledBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(7),
//                   topRight: Radius.circular(8),
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(7)),
//               borderSide: this.error
//                   ? const BorderSide(color: Color(0xffff0022), width: 1)
//                   : const BorderSide(color: Color(0xffDBDBDB), width: 1)),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(7),
//                 topRight: Radius.circular(8),
//                 bottomLeft: Radius.circular(8),
//                 bottomRight: Radius.circular(7)),
//             borderSide: BorderSide(),
//           ),
//           isDense: true,
//           contentPadding: const EdgeInsets.all(15),
//         );
//       default:
//         InputDecoration();
//     }
//   }

//   @override
//   State<FormInputDecoration> createState() => _FormInputDecorationState();
// }

// class _FormInputDecorationState extends State<FormInputDecoration>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class FormInputDecoration {
  final String fieldType;
  final String fieldName;
  final bool error;
  final dynamic showTextFunc;
  final bool showText;
  final dynamic pickBirthday;
  const FormInputDecoration(
      {required this.fieldType,
      required this.fieldName,
      required this.error,
      this.showTextFunc,
      this.pickBirthday,
      required this.showText});
  dynamic myInput() {
    switch (fieldType) {
      case 'text':
        return InputDecoration(
          hintStyle: error
              ? const TextStyle(
                  color: Color(0xffff0022), fontWeight: FontWeight.bold)
              : null,
          hintText: !error ? fieldName : '$fieldName is invalid',
          suffixIcon: error
              ? const Icon(Icons.warning_rounded, color: Color(0xffff0022))
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(7)),
              borderSide: error
                  ? const BorderSide(color: Color(0xffff0022), width: 1)
                  : const BorderSide(color: Color(0xffDBDBDB), width: 1)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(7)),
            borderSide: BorderSide(),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
        );
      case 'email':
        return InputDecoration(
          hintStyle: error
              ? const TextStyle(
                  color: Color(0xffff0022), fontWeight: FontWeight.bold)
              : null,
          hintText: !error ? fieldName : '$fieldName is invalid',
          suffixIcon: error
              ? const Icon(Icons.warning_rounded, color: Color(0xffff0022))
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(7)),
              borderSide: error
                  ? const BorderSide(color: Color(0xffff0022), width: 1)
                  : const BorderSide(color: Color(0xffDBDBDB), width: 1)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(7)),
            borderSide: BorderSide(),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
        );
      case 'password':
        return InputDecoration(
          hintText: fieldName,
          suffixIcon: IconButton(
              onPressed: showTextFunc,
              icon: showText
                  ? Icon(
                      Icons.visibility_off_rounded,
                      color: error ? const Color(0xffff0022) : null,
                    )
                  : Icon(Icons.visibility_rounded,
                      color: error ? const Color(0xffff0022) : null)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(7)),
              borderSide: error
                  ? const BorderSide(color: Color(0xffff0022), width: 1)
                  : const BorderSide(color: Color(0xffDBDBDB), width: 1)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(7),
            ),
            borderSide: BorderSide(color: Color(0xffDBDBDB), width: 1),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
        );

      case 'date':
        return InputDecoration(
          hintStyle: error
              ? const TextStyle(
                  color: Color(0xffff0022), fontWeight: FontWeight.bold)
              : null,
          hintText: !error ? fieldName : '$fieldName is invalid',
          suffixIcon: IconButton(
            onPressed: pickBirthday,
            icon: Icon(Icons.calendar_month,
                color: error ? const Color(0xffff0022) : null),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(7)),
            borderSide: error
                ? const BorderSide(color: Color(0xffff0022), width: 1)
                : const BorderSide(color: Color(0xffDBDBDB), width: 1),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(7),
            ),
            borderSide: BorderSide(),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
        );
      default:
        InputDecoration();
    }
  }
}
