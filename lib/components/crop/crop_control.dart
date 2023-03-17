// import 'dart:typed_data';
//
// import 'package:crop/crop.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// class CropControl {
//   final control = CropController(aspectRatio: 1000 / 1000);
//   int raiseCrop = 0;
//   String? filename;
//   dynamic image = Uint8List.fromList([255, 0, 0, 255, 0, 0, 255]);
//   BoxShape shape = BoxShape.circle;
//
//   void cropRaiser () async {
//     FilePickerResult? result = await FilePicker
//         .platform
//         .pickFiles(type: FileType.image);
//     if (result != null) {
//         filename = result.files.single.name;
//         setState( () => {
//           raiseCrop = 1
//         } );
//
//     }
//     //notifyListeners();
//   }
//
//   void cropImage () async {
//     final cropped = await control.crop();
//     print(cropped);
//   }
//
//
//
// }