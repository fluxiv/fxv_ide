import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fxv_ide/models/user_models.dart';


class FeedPublish extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FeedPublishState();
  }

}
class FeedPublishState extends State<FeedPublish>{
  String userPhoto = "/uploads/default/avatar-image.jpg";
  late Uint8List image;
  int raiseCrop = 0;
  dynamic filename;
  late UserModels userData;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
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
      width: 5000,
      height: 100,
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
    );
  }

}