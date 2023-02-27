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
  String? userid;

  FeedPublishModal({super.key, required this.userid});

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
  late UserModels userData;
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  String selectedItem = 'Item 1';

  @override
  void initState() {
    super.initState();
    getUserData();
  }
  getUserData () async {

      var response = await UserServices().getUserData(widget.userid!);
      Map data = jsonDecode(response.body);
      setState(() {
        userData = UserModels.fromJson(data["data"][0]);
      });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 48, horizontal: 80),
      title: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                borderRadius:  BorderRadius.all(Radius.circular(8)),
              ),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(horizontal: 64,vertical: 32),
              // alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 8.0),
                          child: Image.network(
                            "http://localhost:4040/user/getImage?photo=${userPhoto}",
                            width: 36,
                            height: 36,)),
                      Text(userData.name),
                      // DropdownButton<String>(
                      //   value: selectedItem,
                      //   items: items.map((String item) {
                      //     return DropdownMenuItem<String>(
                      //       value: item,
                      //       child: Text(item),
                      //     );
                      //   }) .toList(),
                      //   onChanged: (String 'newValue') {
                      //     setState(() {
                      //       selectedItem = 'newValue';
                      //     });
                      //   },
                      // ),

                      Expanded(
                        child: TextFormField(
                          onTap: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => FeedPublishModal(userid: widget.userid))
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
            // return Column(
            //   children: [
            //     Text('Upload your profile image',
            //         style: Theme.of(context).textTheme.headline4),
            //     if (raiseCrop == 0)
            //       Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 24),
            //             child: Container(
            //               width: 140,
            //               height: 140,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(9999999)),
            //               child: DottedBorder(
            //                 radius: const Radius.circular(9999999),
            //                 dashPattern: const [4, 3, 4, 3],
            //                 borderType: BorderType.Circle,
            //                 color: const Color(0xffdbdbdb),
            //                 strokeWidth: 4,
            //                 child: Center(
            //                   child: TextButton(
            //                     onPressed: () async {
            //                       setState(() {
            //                         progress = true;
            //                       });
            //
            //                       FilePickerResult? result = await FilePicker
            //                           .platform
            //                           .pickFiles(type: FileType.image);
            //                       if (result != null) {
            //                         //image = File(result.files.first.path!);
            //                         image = result.files.first.bytes!;
            //                         filename = result.files.single.name;
            //                         //CropImage(image: image);
            //                         setState(() {
            //                           raiseCrop = 1;
            //                           image = result.files.first.bytes!;
            //                         });
            //                       }
            //                     },
            //                     child: progress
            //                         ? const CircularProgressIndicator(
            //                       color: Colors.black,
            //                     )
            //                         : const Icon(
            //                       Icons.add_a_photo,
            //                       size: 64,
            //                       color: Color(0xffc4c4c4),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 12),
            //             child: TextButton(
            //               onPressed: () async {
            //                 Navigator.pop(context, 'img');
            //               },
            //               child: const Text('Mayber later!'),
            //             ),
            //           )
            //         ],
            //       ),
            //   ],
            // );
          }),

    );
  }

}