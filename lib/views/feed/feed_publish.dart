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
      width: 5000,
      height: 100,
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(right: 8.0),
            child: Image.network(
        "http://localhost:4040/getImage?photo=${userPhoto}"),),
            TextFormField(
                decoration: const InputDecoration(
                  hintText: 'What do you want to say today?',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(7)),
                      borderSide: BorderSide(color: Color(0xffDBDBDB), width: 100)),
                  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
          ],
        ),
    );
  }

}