import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormDynamicFields extends StatefulWidget{
  final String fieldName;
  final String fieldType;
  final dynamic formHasErrors;
  final dynamic showPassArgs;
  const FormDynamicFields({
    super.key,
    required this.fieldName,
    required this.fieldType,
    required this.formHasErrors,
    this.showPassArgs
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
                  widget.formHasErrors(true);
                });
              } else {
                setState((){
                  hasError = false;
                  widget.formHasErrors(false);
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
            if(value.isEmpty && !isEmail(value)){
              setState((){
                hasError = true;
                widget.formHasErrors(true);
              });
            } else {
              hasError = false;
              widget.formHasErrors(false);
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
        child: TextFormField(
        controller: _fieldController,
            obscureText: showText,
            decoration: InputDecoration(
                hintText:  widget.fieldName,
                suffixIcon: IconButton(onPressed: showTextFunc,
                    icon: showText ? const Icon(Icons.visibility_off_rounded) : const Icon(Icons.visibility_rounded)),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(7)),
                    borderSide: BorderSide(color: Color(0xffDBDBDB),width: 1)
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
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.info_rounded,color: Color(0xff939393),),),
                      Text('Password need at least 8 caracheters',style: TextStyle(color: Color(0xff939393),fontFamily: 'Heebo'),)
                    ],
                  ),)
                ],
              )
          ],
        );
    }
  }



}