import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:fxv_ide/services/shared_services.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fxv_ide/services/user_services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FeedPublishModal extends StatefulWidget {
  String userid;

  FeedPublishModal({super.key, required this.userid});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedPublishModal();
  }
}

class _FeedPublishModal extends State<FeedPublishModal> {
  int raiseCrop = 0;
  bool progress = false;
  dynamic image;
  String? filename;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
      title: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Text('Upload your profile image',
                    style: Theme.of(context).textTheme.headline4),
                if (raiseCrop == 0)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9999999)),
                          child: DottedBorder(
                            radius: const Radius.circular(9999999),
                            dashPattern: const [4, 3, 4, 3],
                            borderType: BorderType.Circle,
                            color: const Color(0xffdbdbdb),
                            strokeWidth: 4,
                            child: Center(
                              child: TextButton(
                                onPressed: () async {
                                  setState(() {
                                    progress = true;
                                  });

                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles(type: FileType.image);
                                  if (result != null) {
                                    //image = File(result.files.first.path!);
                                    image = result.files.first.bytes!;
                                    filename = result.files.single.name;
                                    //CropImage(image: image);
                                    setState(() {
                                      raiseCrop = 1;
                                      image = result.files.first.bytes!;
                                    });
                                  }
                                },
                                child: progress
                                    ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                                    : const Icon(
                                  Icons.add_a_photo,
                                  size: 64,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextButton(
                          onPressed: () async {
                            Navigator.pop(context, 'img');
                          },
                          child: const Text('Mayber later!'),
                        ),
                      )
                    ],
                  ),
              ],
            );
          }),

    );
  }

}