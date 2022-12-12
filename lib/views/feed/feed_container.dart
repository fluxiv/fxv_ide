import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fxv_ide/components/crop_image.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/services/user_services.dart';
import 'package:iconsax/iconsax.dart';

class FeedContainer extends StatefulWidget{
  const FeedContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeedContainerState();
  }

}
class FeedContainerState extends State<FeedContainer>{
  late Uint8List image;
  int raiseCrop = 0;
  dynamic filename;
  //final _cropperKey = GlobalKey(debugLabel: 'cropperKey');
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
        showDialog(context: context, builder: (BuildContext context) => ImageCropper(userData:userData));
      }
    } else {
      print('user not logged id');
    }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          toolbarTextStyle: const TextStyle(color: Color(0xff000000)),
          backgroundColor: const Color(0xffffffff),
          title: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: IconButton(
              iconSize: 100,
              onPressed: () => Navigator.pushNamed(context, '/'),
              icon: SizedBox(
                width: 100,
                child: Image.asset(
                  "assets/logo/fxvLogo.png",
                ),
              ),
            ),
          ),
            actions: [
              IconButton(onPressed: null, icon: Icon(Iconsax.notification_circle1)),
              ElevatedButton(onPressed: null, child: Text("testeteste"))
          ],

        ),
        body: Row(
          children: [
            // if(raiseCrop == 1)
            // CropImage(image: image),
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