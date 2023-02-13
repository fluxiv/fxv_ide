import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/components/feed_publish_modal.dart';
import 'package:iconsax/iconsax.dart';


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
          borderRadius:  BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      // alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 8.0),
                    child: Image.network(
                      "http://localhost:4040/getImage?photo=${userPhoto}",
                      width: 36,
                      height: 36,)),
                Expanded(
                  child: TextFormField(
                    onTap: () => {
                    showDialog(
                    context: context,
                    builder: (BuildContext context) => FeedPublishModal(userid: userData.id))
                    },
                    decoration: const InputDecoration(
                      hintText: 'What do you want to say today?',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(7)),
                          borderSide: BorderSide(color: Color(0xffDBDBDB), width: 1)),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),)

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 1,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 8),
                  child: IconButton(onPressed: () => {}, icon: Icon(Iconsax.image5)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: IconButton(onPressed: () => {}, icon: Icon(Iconsax.chart5)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: IconButton(onPressed: () => {}, icon: Icon(Iconsax.calendar5)),
                ),

              ],
            )
          ],
        ),

    );
  }

}