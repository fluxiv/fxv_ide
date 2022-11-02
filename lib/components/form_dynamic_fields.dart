import 'dart:async';

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'form_input_decoration.dart';

class FormDynamicFields extends StatefulWidget {
  final String fieldName;
  final String fieldType;
  final dynamic changeFormState;
  final dynamic showPassArgs;
  final dynamic fieldRef;
  final dynamic formRef;
  const FormDynamicFields({
    super.key,
    required this.fieldName,
    required this.fieldType,
    required this.changeFormState,
    this.showPassArgs,
    this.fieldRef,
    this.formRef,
  });

  @override
  State<StatefulWidget> createState() {
    return FormDynamicState();
  }
}

class FormDynamicState extends State<FormDynamicFields> {
  final TextEditingController _fieldController = TextEditingController();
  late FocusNode myFocusNode = FocusNode();
  bool hasData = false;
  bool hasError = false;
  bool showText = true;
  int passwordLengthError = 0;
  int passwordUpperLowerError = 0;
  int passwordSpecialNumberError = 0;
  var maskFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9.\-\/]')});

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 1), (){
    setState(() {
    widget.changeFormState(0, widget.fieldName, '');
    });
    });
  }


  @override
  Widget build(BuildContext context) {
    return myField();
  }

  showTextFunc() {
    setState(() {
      showText = !showText;
    });
  }

  pickBirthday() {
    myFocusNode.requestFocus();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2500),
    ).then(
      (x) => {
        if (x?.day != null)
          {
            setState(
              (() => {
                    // BirthdayDate =
                    //     "${value?.day}/${value?.month}/${value?.year}",
                    hasData = true,
                    _fieldController.text = DateFormat('dd/MM/yyyy').format(x!),
                    hasError = false
                  }),
            )
          }
        else
          {
            setState(
              (() => {hasError = true}),
            )
          }
      },
    );
  }

  dynamic myField() {
    switch (widget.fieldType) {
      case 'text':
        return Focus(
          onFocusChange: (focus) {
            if (!focus) {
              String value = _fieldController.value.text;
              if (value.isEmpty || value.length < 3) {
                setState(() {
                  hasError = true;
                  widget.changeFormState(1, widget.fieldName, value);
                });
              } else {
                setState(() {
                  hasError = false;
                  widget.changeFormState(2, widget.fieldName, value);
                });
              }
            }
          },
          child: TextFormField(
            controller: _fieldController,
            decoration: FormInputDecoration(
                    error: hasError,
                    fieldName: widget.fieldName,
                    fieldType: widget.fieldType,
                    showText: showText)
                .myInput(),
            style: const TextStyle(fontSize: 15.0),
          ),
        );

      case 'email':
        return Focus(
          onFocusChange: (focus) {
            if (!focus) {
              String value = _fieldController.value.text;
              if (value.isEmpty || !isEmail(value)) {
                setState(() {
                  hasError = true;
                  widget.changeFormState(1, widget.fieldName, value);
                });
              } else {
                hasError = false;
                widget.changeFormState(2, widget.fieldName, value);
              }
            }
          },
          child: TextFormField(
            controller: _fieldController,
            decoration: FormInputDecoration(
                    error: hasError,
                    fieldName: widget.fieldName,
                    fieldType: widget.fieldType,
                    showText: showText)
                .myInput(),
            style: const TextStyle(fontSize: 15.0),
          ),
        );

      case 'password':
        return Column(
          children: [
            Focus(
              onFocusChange: (focus) {
                dynamic value = _fieldController.value.text;
                if (!focus && widget.showPassArgs) {
                  if (passwordUpperLowerError != 2 ||
                      passwordSpecialNumberError != 2 ||
                      passwordLengthError != 2) {
                    setState(() {
                      hasError = true;
                      widget.changeFormState(1, widget.fieldName, value);
                    });
                  } else if (passwordUpperLowerError == 2 &&
                      passwordSpecialNumberError == 2 &&
                      passwordLengthError == 2) {
                    setState(() {
                      hasError = false;
                      widget.changeFormState(2, widget.fieldName, value);
                    });
                  }
                } else if (!focus &&
                    !widget.showPassArgs &&
                    widget.fieldRef == null) {
                  if (value.isNotEmpty) {
                    setState(() {
                      hasError = false;
                      widget.changeFormState(2, widget.fieldName, value);
                    });
                  } else {
                    setState(() {
                      hasError = true;
                      widget.changeFormState(1, widget.fieldName, value);
                    });
                  }
                } else if (!focus &&
                    !widget.showPassArgs &&
                    widget.fieldRef != null) {
                  var index = widget.formRef.indexWhere((v) => v.fieldName == widget.fieldRef);
                  dynamic refValue = widget.formRef[index].value;
                  if (refValue != '' && refValue == value) {
                    setState(() {
                      hasError = false;
                      widget.changeFormState(2, widget.fieldName, value);
                    });
                  } else {
                    setState(() {
                      hasError = true;
                      widget.changeFormState(1, widget.fieldName, value);
                    });
                  }
                }
              },
              child: TextFormField(
                controller: _fieldController,
                obscureText: showText,
                onChanged: (value) {
                  //var regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value.length < 8) {
                    setState(() {
                      passwordLengthError = 1;
                    });
                  } else {
                    setState(() {
                      passwordLengthError = 2;
                    });
                  }

                  if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(value)) {
                    setState(() {
                      passwordUpperLowerError = 2;
                    });
                  } else {
                    passwordUpperLowerError = 1;
                  }

                  if (RegExp(r'^(?=.*?[0-9])(?=.*[!@#$&*])').hasMatch(value)) {
                    setState(() {
                      passwordSpecialNumberError = 2;
                    });
                  } else {
                    setState(() {
                      passwordSpecialNumberError = 1;
                    });
                  }
                },
                decoration: FormInputDecoration(
                        error: hasError,
                        fieldName: widget.fieldName,
                        fieldType: widget.fieldType,
                        showText: showText,
                        showTextFunc: showTextFunc)
                    .myInput(),
                style: const TextStyle(fontSize: 15.0),
              ),
            ),
            if (widget.showPassArgs)
              Column(
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            passwordLengthError == 0
                                ? Icons.info_rounded
                                : passwordLengthError == 1
                                    ? Icons.error_rounded
                                    : Icons.check_circle,
                            color: passwordLengthError == 0
                                ? const Color(0xff939393)
                                : passwordLengthError == 1
                                    ? const Color(0xffff0022)
                                    : const Color(0xff41D06A),
                          ),
                        ),
                        Text(
                          'Password need at least 8 characters and',
                          style: TextStyle(
                              color: passwordLengthError == 0
                                  ? const Color(0xff939393)
                                  : passwordLengthError == 1
                                      ? const Color(0xffff0022)
                                      : const Color(0xff41D06A),
                              fontFamily: 'Heebo'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            passwordUpperLowerError == 0
                                ? Icons.info_rounded
                                : passwordUpperLowerError == 1
                                    ? Icons.error_rounded
                                    : Icons.check_circle,
                            color: passwordUpperLowerError == 0
                                ? const Color(0xff939393)
                                : passwordUpperLowerError == 1
                                    ? const Color(0xffff0022)
                                    : const Color(0xff41D06A),
                          ),
                        ),
                        Text(
                          '1 uppercase and lowercase character and',
                          style: TextStyle(
                              color: passwordUpperLowerError == 0
                                  ? const Color(0xff939393)
                                  : passwordUpperLowerError == 1
                                      ? const Color(0xffff0022)
                                      : const Color(0xff41D06A),
                              fontFamily: 'Heebo'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              passwordSpecialNumberError == 0
                                  ? Icons.info_rounded
                                  : passwordSpecialNumberError == 1
                                      ? Icons.error_rounded
                                      : Icons.check_circle,
                              color: passwordLengthError == 0
                                  ? const Color(0xff939393)
                                  : passwordSpecialNumberError == 1
                                      ? const Color(0xffff0022)
                                      : const Color(0xff41D06A),
                            ),
                          ),
                          Text(
                            '1 special and numeric character',
                            style: TextStyle(
                                color: passwordSpecialNumberError == 0
                                    ? const Color(0xff939393)
                                    : passwordSpecialNumberError == 1
                                        ? const Color(0xffff0022)
                                        : const Color(0xff41D06A),
                                fontFamily: 'Heebo'),
                          )
                        ],
                      ))
                ],
              )
          ],
        );
      case 'date':
        return Focus(
          onFocusChange: (focus) {
            if (!focus) {
              var value = _fieldController.value.text;
              if (value.isEmpty || value.length < 3) {
                setState(() {
                  hasError = true;
                  widget.changeFormState(1, widget.fieldName, value);
                });
              } else {
                setState(() {
                  hasError = false;
                  widget.changeFormState(2, widget.fieldName, value);
                });
              }
            }
          },
          child: TextFormField(
            focusNode: myFocusNode,
            controller: _fieldController,
            inputFormatters: [maskFormatter],
            decoration: FormInputDecoration(
              error: hasError,
              fieldName: widget.fieldName,
              fieldType: widget.fieldType,
              showText: showText,
              pickBirthday: pickBirthday,
            ).myInput(),
          ),
        );
    }
  }
}
