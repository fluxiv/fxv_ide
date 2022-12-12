import 'dart:convert';
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  final _cropperKey = CropController();
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
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 48),
            title: StatefulBuilder(builder: (BuildContext context, StateSetter setState){
              return Column(
                children: [
                  Text('Upload your profile image',style: Theme.of(context).textTheme.headline4),
                  if(raiseCrop == 0)
                    Column(
                      children: [
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
                                dashPattern: const [4,3,4,3],
                                borderType: BorderType.Circle,
                                color: const Color(0xffdbdbdb),
                                strokeWidth: 4,
                                child: Center(
                                  child: TextButton(onPressed: () async {
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                                    if(result != null){
                                      //image = File(result.files.first.path!);
                                      image = result.files.first.bytes!;
                                      filename = result.files.single.name;
                                      //CropImage(image: image);
                                      setState(() {
                                        raiseCrop = 1;
                                        image = result.files.first.bytes!;
                                      });

                                    }
                                  }, child: const Icon(Icons.add_a_photo,size: 64,color: Color(0xffc4c4c4),)),
                                ),
                              ),
                            )
                        ),
                        Padding(padding: const EdgeInsets.symmetric(vertical: 12),
                          child: TextButton(
                            onPressed: () async {
                              Navigator.pop(context,'img');
                            },
                            child: const Text('Maybe later!'),
                          ),
                        )
                      ],
                    ),

                  if(raiseCrop == 1)
                    Column(
                      children: [
                        Padding(padding: const EdgeInsets.symmetric(vertical: 24),
                          child: SizedBox(
                            width: 160,
                            height: 160,
                            child: Crop(
                              controller: _cropperKey,
                              image: image,
                              aspectRatio: 1.0,
                              cornerDotBuilder: (size, edgeAlignment) => const DotControl(color: Colors.blue),
                              onCropped: (img) async {
                                var response = await UserServices().saveProfilePicture(userData.id, img,filename);
                                if(response.statusCode == 201 && mounted){
                                  Navigator.pop(context,'img');
                                }
                              },

                            ),
                          ),),
                        Padding(padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                                  if(result != null){
                                    filename = result.files.single.name;
                                    setState(() {
                                      image = result.files.first.bytes!;
                                    });
                                  } else {
                                    setState((){
                                      raiseCrop = 0;
                                    });
                                  }
                                },
                                child: const Text('Pick another one')),
                            ElevatedButton(
                                onPressed: _cropperKey.crop,
                                child: const Text('Save image'))
                          ],
                        ),)
                      ],
                    )


                ],
              );
            }),
          );
        } );
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