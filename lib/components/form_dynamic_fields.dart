import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormDynamicFields extends StatefulWidget{
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
class FormDynamicState extends State<FormDynamicFields>{
  final TextEditingController _fieldController = TextEditingController();
  bool hasError = false;
  bool showText = true;
  int passwordLengthError = 0;
  int passwordUpperLowerError = 0;
  int passwordSpecialNumberError = 0;
  @override
  Widget build(BuildContext context) {
    return myField();
  }

  showTextFunc(){
    setState((){
      showText = !showText;
    });
  }

  dynamic myField(){
    switch(widget.fieldType){


      case 'text':
        return Focus(
          onFocusChange: (focus){
            if(!focus){
              String value = _fieldController.value.text;
              if(value.isEmpty || value.length < 3){
                setState((){
                  hasError = true;
                  widget.changeFormState(true,widget.fieldName,value);
                });
              } else {
                setState((){
                  hasError = false;
                  widget.changeFormState(false,widget.fieldName,value);
                });
              }
            }
          },
          child:  TextFormField(
                  controller: _fieldController,
                  decoration: InputDecoration(
                    hintStyle: hasError ? const TextStyle(color: Color(0xffff0022),fontWeight: FontWeight.bold) : null,
                      hintText:  !hasError ? widget.fieldName : '${widget.fieldName} is invalid',
                      suffixIcon: hasError ? const Icon(Icons.warning_rounded,color: Color(0xffff0022)) : null,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                          borderSide: hasError ? const BorderSide(color: Color(0xffff0022),width: 1) : const BorderSide(color: Color(0xffDBDBDB),width: 1)
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                        borderSide: BorderSide(),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15)),
                  style: const TextStyle(fontSize: 15.0)
          ),
          );


      case 'email':
        return Focus(
            onFocusChange: (focus){
          if(!focus){
            String value = _fieldController.value.text;
            if(value.isEmpty || !isEmail(value)){
              setState((){
                hasError = true;
                widget.changeFormState(true,widget.fieldName,value);
              });
            } else {
              hasError = false;
              widget.changeFormState(false,widget.fieldName,value);
            }
          }
        },
          child: TextFormField(
              controller: _fieldController,
              decoration: InputDecoration(
                  hintStyle: hasError ? const TextStyle(color: Color(0xffff0022),fontWeight: FontWeight.bold) : null,
                  hintText:  !hasError ? widget.fieldName : '${widget.fieldName} is invalid',
                  suffixIcon: hasError ? const Icon(Icons.warning_rounded,color: Color(0xffff0022)) : null,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                      borderSide: hasError ? const BorderSide(color: Color(0xffff0022),width: 1) : const BorderSide(color: Color(0xffDBDBDB),width: 1)
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                    borderSide: BorderSide(),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15)),
              style: const TextStyle(fontSize: 15.0)
          ),
        );


      case 'password':
        return Column(
          children: [
        Focus(
          onFocusChange: (focus) {
            String value = _fieldController.value.text;
            if(!focus && widget.showPassArgs){
              if(passwordUpperLowerError != 2 || passwordSpecialNumberError != 2 || passwordLengthError != 2){
                setState((){
                  hasError = true;
                  widget.changeFormState(true,widget.fieldName,value);
                });
              } else if(passwordUpperLowerError == 2 && passwordSpecialNumberError == 2 && passwordLengthError == 2){
                setState((){
                  hasError = false;
                  widget.changeFormState(false,widget.fieldName,value);
                });
              }
            } else if(!focus && !widget.showPassArgs && widget.fieldRef == null){
              if(value.isNotEmpty){
                setState((){
                  hasError = false;
                  widget.changeFormState(false,widget.fieldName,value);
                });
              } else {
                setState((){
                  hasError = true;
                  widget.changeFormState(true,widget.fieldName,value);
                });
              }
            } else if(!focus && !widget.showPassArgs && widget.fieldRef != null){
              var refValue = widget.formRef[widget.fieldRef]['value'];
              if(refValue != '' && refValue == value){
                setState((){
                  hasError = false;
                  widget.changeFormState(false,widget.fieldName,value);
                });
              } else {
                setState((){
                  hasError = true;
                  widget.changeFormState(true,widget.fieldName,value);
                });
              }
            }
          },
        child: TextFormField(
        controller: _fieldController,
            obscureText: showText,
            onChanged: (value) {
              //var regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
              if(value.length < 8){
                setState((){
                  passwordLengthError = 1;
                });
              } else {
                setState((){
                  passwordLengthError = 2;
                });
              }

              if(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(value)){
                setState((){
                  passwordUpperLowerError = 2;
                });
              } else {
                passwordUpperLowerError = 1;
              }

              if(RegExp(r'^(?=.*?[0-9])(?=.*[!@#$&*])').hasMatch(value)){
                setState((){
                  passwordSpecialNumberError = 2;
                });
              } else {
                setState((){
                  passwordSpecialNumberError = 1;
                });
              }
            },
            decoration: InputDecoration(
                hintText:  widget.fieldName,
                suffixIcon: IconButton(onPressed: showTextFunc,
                    icon: showText ? Icon(Icons.visibility_off_rounded,color: hasError ? const Color(0xffff0022) : null,) : Icon(Icons.visibility_rounded,color: hasError ? const Color(0xffff0022) : null)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                    borderSide: hasError ? const BorderSide(color: Color(0xffff0022),width: 1) : const BorderSide(color: Color(0xffDBDBDB),width: 1)
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                    borderSide: BorderSide(color: Color(0xffDBDBDB),width: 1)
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(15)),
            style: const TextStyle(fontSize: 15.0)
        ),
    ),
            if(widget.showPassArgs)
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
                        child: Icon( passwordLengthError == 0 ? Icons.info_rounded :  passwordLengthError == 1 ? Icons.error_rounded : Icons.check_circle,color: passwordLengthError == 0 ? const Color(0xff939393) : passwordLengthError == 1 ? const Color(0xffff0022) : const Color(0xff41D06A),),),
                      Text('Password need at least 8 characters and',style: TextStyle(color: passwordLengthError == 0 ? const Color(0xff939393) : passwordLengthError == 1 ? const Color(0xffff0022) : const Color(0xff41D06A),fontFamily: 'Heebo'),)
                    ],
                  ),),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon( passwordUpperLowerError == 0 ? Icons.info_rounded :  passwordUpperLowerError == 1 ? Icons.error_rounded : Icons.check_circle,color: passwordUpperLowerError == 0 ? const Color(0xff939393) : passwordUpperLowerError == 1 ? const Color(0xffff0022) : const Color(0xff41D06A),),),
                        Text('1 uppercase and lowercase character and',style: TextStyle(color: passwordUpperLowerError == 0 ? const Color(0xff939393) : passwordUpperLowerError == 1 ? const Color(0xffff0022) : const Color(0xff41D06A),fontFamily: 'Heebo'),)
                      ],
                    ),),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon( passwordSpecialNumberError == 0 ? Icons.info_rounded :  passwordSpecialNumberError == 1 ? Icons.error_rounded : Icons.check_circle,color: passwordLengthError == 0 ? const Color(0xff939393) : passwordSpecialNumberError == 1 ? const Color(0xffff0022) : const Color(0xff41D06A),),),
                        Text('1 special and numeric character',style: TextStyle(color: passwordSpecialNumberError == 0 ? const Color(0xff939393) : passwordSpecialNumberError == 1 ? const Color(0xffff0022) : const Color(0xff41D06A),fontFamily: 'Heebo'),)
                      ],
                    ))
                ],
              )
          ],
        );
      case 'date':
        return Focus(
          child: TextFormField(
            controller: _fieldController,
            decoration: InputDecoration(
                hintStyle: hasError ? const TextStyle(color: Color(0xffff0022),fontWeight: FontWeight.bold) : null,
                hintText:  !hasError ? widget.fieldName : '${widget.fieldName} is invalid',
                suffixIcon: hasError ? const Icon(Icons.warning_rounded,color: Color(0xffff0022)) : null,
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                    borderSide: hasError ? const BorderSide(color: Color(0xffff0022),width: 1) : const BorderSide(color: Color(0xffDBDBDB),width: 1)
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                  borderSide: BorderSide(),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(15)),
          ),
        );
    }
  }



}