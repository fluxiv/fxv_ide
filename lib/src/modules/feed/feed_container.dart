import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:fxv_ide/src/models/user_models.dart';
import 'package:fxv_ide/src/modules/feed/feed_left_side.dart';
import 'package:fxv_ide/src/modules/feed/feed_publish.dart';
import 'package:fxv_ide/src/modules/feed/widgets/crop_image.dart';
import 'package:fxv_ide/src/modules/feed/widgets/feed_post.dart';
import 'package:fxv_ide/src/services/shared_services.dart';
import 'package:fxv_ide/src/services/user_services.dart';

import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedContainer extends StatelessWidget {
  const FeedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic id = ModalRoute.of(context)?.settings.arguments;

    // TODO: implement build
    return FeedContainerState(id: id);
  }
}

class FeedContainerState extends StatefulWidget {
  final dynamic id;
  const FeedContainerState({super.key, this.id});

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
    dynamic id = await SharedServices().getString('id');
    if (id != null && id != '') {
      setState(() {
        userId = id;
      });
      print(userId);
      var response = await UserServices().getUserData(id);
      Map data = jsonDecode(response.body);
      userData = UserModels.fromJson(data["data"][0]);
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) => ImageCropper(userData: userData!));
    } else {
      print('user not logged id');
    }
    // final String id = "1";
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
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                    child: IconButton(
                        onPressed: () => {},
                        icon: Icon(Iconsax.notification5))),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                    child: IconButton(
                        onPressed: () => {}, icon: Icon(Iconsax.message5))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  child: IconButton(
                      onPressed: () => {},
                      icon: Image.network(
                          'http://localhost:4040/user/getImage?photo=${userPhoto}')),
                ),
              ],
            )
          ]),
      body: Row(
        children: [
          // if(raiseCrop == 1)
          // CropImage(image: image),
          Expanded(flex: 3, child: FeedLeftSide()),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Visibility(
                            child: FeedPublish(userId: userId),
                            visible: userId != '',
                          ),
                          FeedPost(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(flex: 3, child: Container(color: Colors.white)),
        ],
      ),
    );
  }
}
