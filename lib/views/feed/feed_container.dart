import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fxv_ide/components/crop_image.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/services/user_services.dart';
import 'package:fxv_ide/views/feed/feed_publish.dart';
import 'package:iconsax/iconsax.dart';

class FeedContainer extends StatefulWidget {
  const FeedContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeedContainerState();
  }
}

class FeedContainerState extends State<FeedContainer> {
  String userPhoto = "/uploads/default/avatar-image.jpg";
  late Uint8List image;
  int raiseCrop = 0;
  dynamic filename;
  late UserModels userData;
  //final _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    final id = await SharedServices().getString('id');
    // final String id = "1";
    if (id != null && id != '') {
      var response = await UserServices().getUserData(id);
      Map data = jsonDecode(response.body);
      userData = UserModels.fromJson(data["data"][0]);
      // setState(() {
      //   userPhoto = userData.photo!;
      // });
      // if (userData.photo == null || userData.photo == '') {
      showDialog(
          context: context,
          builder: (BuildContext context) => ImageCropper(userData: userData));
      // }
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
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Iconsax.notification5,
                        color: Color(0xff555555), size: 16),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xffffffff)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed))
                          return Color(0xfff4f4f8); // <-- Splash color
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Iconsax.message5,
                        color: Color(0xff555555), size: 16),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xffffffff)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed))
                          return Color(0xfff4f4f8); // <-- Splash color
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Image.network(
                        "http://localhost:4040/getImage?photo=${userPhoto}"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xffffffff)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed))
                          return Color(0xfff4f4f8); // <-- Splash color
                      }),
                    ),
                  ),
                ),
              ],
            )
          ]),
      body: Row(
        children: [
          // if(raiseCrop == 1)
          // CropImage(image: image),
          Expanded(flex: 3, child: Container(color: Colors.red)),
          Expanded(flex: 4, child: Column(
            children:[
              FeedPublish()
            ]
          )),
          Expanded(flex: 3, child: Container(color: Colors.red)),
        ],
      ),
    );
  }
}
