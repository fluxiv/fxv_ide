import 'dart:typed_data';
import 'package:cropperx/cropperx.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:crop_your_image/crop_your_image.dart';


import 'package:flutter/material.dart';
import 'package:fxv_ide/src/models/user_models.dart';
import 'package:dotted_border/dotted_border.dart';

class ImageCropper extends StatefulWidget {
  final UserModels userData;

  const ImageCropper({super.key, required this.userData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageCropper();
  }
}

class _ImageCropper extends State<ImageCropper> {

  int raiseCrop = 0;
  String? filename;
  dynamic image = Uint8List.fromList([255, 0, 0, 255, 0, 0, 255]);
  final _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  void cropRaiser () async  {
    //print('eu roodo nesse porra?!');
    FilePickerResult? result = await FilePicker
        .platform
        .pickFiles(type: FileType.image);
    if (result != null) {
      filename = result.files.single.name;
      setState(() {
        image = result.files.first.bytes!;
        raiseCrop = 1;
      });
    } else {
      setState(() {
        raiseCrop = 0;
      });
    }
  }
  //final _cropperKey = CropController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
      title:
      Column(
        children: [
          Text('Upload your profile image',
              style: Theme.of(context).textTheme.headline4),
          Visibility(
              visible: raiseCrop == 0 ? true : false,
              child: Column(
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
                            onPressed: cropRaiser,
                            child: const Icon(
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
              ))
          ,

          //RAISE 1 HERE


          Visibility(
              visible: raiseCrop == 1 ? true : false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: SizedBox(
                        width: 160,
                        height: 160,
                        child: Cropper(
                            cropperKey: _cropperKey,
                            image: Image.memory(image)
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(type: FileType.image);
                              if (result != null) {
                                filename = result.files.single.name;
                                setState(() {
                                  image = result.files.first.bytes!;
                                });
                              } else {
                                setState(() {
                                  raiseCrop = 0;
                                });
                              }
                            },
                            child: const Text('Pick another one')),
                        ElevatedButton(
                            onPressed: cropImage,
                            child: const Text('Save image'))
                      ],
                    ),
                  )
                ],
              ))

        ],
      ),
    );
  }

  void cropImage() async {
    final imageBytes = await Cropper.crop(
      cropperKey: _cropperKey, // Reference it through the key
    );
    print(imageBytes);
  }

}
