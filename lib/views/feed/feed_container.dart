import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/services/user_services.dart';
import 'package:crop_your_image/crop_your_image.dart';

class FeedContainer extends StatefulWidget{
  const FeedContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeedContainerState();
  }

}
class FeedContainerState extends State<FeedContainer>{
  @override
  void initState(){
    super.initState();
    checkUser();
  }
  checkUser() async{
    final id = await SharedServices().getString('id');
    if(id != null && id != ''){
      var response = await UserServices().getUserData(id);
      Map data = jsonDecode(response.body);
      var userData = UserModels.fromJson(data["data"][0]);
      if(userData.photo == null || userData.photo == ''){
        showDialog(context: context, builder: (BuildContext context) => AlertDialog(
          titlePadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 48),
          title: Column(
            children: [
              Text('Upload your profile image',style: Theme.of(context).textTheme.headline4),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999999)
                  ),
                  child: DottedBorder(
                    radius: const Radius.circular(9999999),
                    dashPattern: [4,3,4,3],
                    borderType: BorderType.Circle,
                    color: Color(0xffdbdbdb),
                    strokeWidth: 4,
                    child: Center(
                      child: TextButton(onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();
                      }, child: Icon(Icons.add_a_photo,size: 64,color: Color(0xffc4c4c4),)),
                    ),
                  ),
                )
              )
            ],
          ),
        ));
      }
    } else {
      print('user not logged id');
    }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false
        ),
        body: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(color: Colors.red)),
            Expanded(
                flex: 4,
                child: Container(color: Colors.blue)),
            Expanded(
                flex: 3,
                child: Container(color: Colors.red)),
          ],
        ),
      );
  }

}