import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fxv_ide/services/user_services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/components/feed_publish_modal.dart';
import 'package:iconsax/iconsax.dart';

class FeedPublishModal extends StatefulWidget {
  final String userid;

  const FeedPublishModal({super.key, required this.userid});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedPublishModal();
  }
}

class _FeedPublishModal extends State<FeedPublishModal> {
  //int raiseCrop = 0;
  //bool progress = false;
  //dynamic image;
  //String? filename;
  String userPhoto = "/uploads/default/avatar-image.jpg";
  late Uint8List image;
  int raiseCrop = 0;
  dynamic filename;
  UserModels? userData;
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  String selectedItem = 'Item 1';

  @override
  void initState() {
    super.initState();
    getUserData();
  }
  getUserData () async {

      var response = await UserServices().getUserData(widget.userid);
      Map data = jsonDecode(response.body);
      setState(() {
        userData = UserModels.fromJson(data["data"][0]);
      });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      title: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 48),
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                borderRadius:  const BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(
                                "http://localhost:4040/user/getImage?photo=$userPhoto",
                                width: 36,
                                height: 36)),
                          Text(userData?.name ?? ''),
                          DropdownButton<String>(
                            value: selectedItem,
                            items: items.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }) .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedItem = newValue!;
                              });
                            },
                          ),



                        ],
                      ),
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child:                 Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "What's the title?",
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
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: null,
                                minLines: 3,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  hintText: "What's the description?",
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
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(onPressed: () => {}, icon: const Icon(Iconsax.image5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(onPressed: () => {}, icon: const Icon(Iconsax.chart5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(onPressed: () => {}, icon: const Icon(Iconsax.calendar5)),
                        ),

                      ],
                    ),
                  )

                ],
              ),

            );

          }),

    );
  }

}