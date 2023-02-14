import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fxv_ide/components/crop_image.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/services/user_services.dart';
import 'package:fxv_ide/views/feed/feed_publish.dart';
import 'package:iconsax/iconsax.dart';
class FeedContainer extends StatelessWidget {
  const FeedContainer({super.key});

  @override
  Widget build(BuildContext context) {
      dynamic id = ModalRoute.of(context)?.settings.arguments;

    // TODO: implement build
    return FeedContainerState(id:id);
  }

}
class FeedContainerState extends StatefulWidget {
  final dynamic id;
  const FeedContainerState({super.key,this.id});


  @override
  State<StatefulWidget> createState() {
    return _FeedContainerState();
  }
}

class _FeedContainerState extends State<FeedContainerState> {
  String userPhoto = "/uploads/default/avatar-image.jpg";
  late Uint8List image;
  int raiseCrop = 0;
  dynamic filename;
  UserModels? userData;
  String userId = '';
  //final _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    String? id = widget.id ?? await SharedServices().getString('id');
    // final String id = "1";
    print(id);
    if (id != null && id != '') {
      userId = id;
      var response = await UserServices().getUserData(id);
      Map data = jsonDecode(response.body);
      userData = UserModels.fromJson(data["data"][0]);
      showDialog(
          context: context,
          builder: (BuildContext context) => ImageCropper(userData: userData!));
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
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xffffffff)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color(0xfff4f4f8);
                        }
                        return null; // <-- Splash color
                      }),
                    ),
                    child:  const Icon( Iconsax.notification5,
                        color: Color(0xff555555), size: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xffffffff)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color(0xfff4f4f8);
                        }
                        return null; // <-- Splash color
                      }),
                    ),
                    child: const Icon(Iconsax.message5,
                        color: Color(0xff555555), size: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xffffffff)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color(0xfff4f4f8);
                        }
                        return null; // <-- Splash color
                      }),
                    ),
                    child: Image.network(
                        "http://localhost:4040/user/getImage?photo=$userPhoto"),
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
              Visibility(
                child: FeedPublish(userId: userId),
              )

            ]
          )),
          Expanded(flex: 3, child: Container(color: Colors.red)),
        ],
      ),
    );
  }
}
