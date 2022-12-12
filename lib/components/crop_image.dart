// import 'dart:typed_data';
//
// import 'package:crop_your_image/crop_your_image.dart';
// import 'package:cropperx/cropperx.dart';
// import 'package:flutter/material.dart';
//
// class CropImage extends StatefulWidget{
//   final Uint8List image;
//   const CropImage({super.key,required this.image});
//
//
//   @override
//   State<StatefulWidget> createState() {
//     return CropState();
//   }
//
// }
// class CropState extends State<CropImage>{
//   final _controller = CropController();
//   final _cropperKey = GlobalKey(debugLabel: 'cropperKey');
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     // return Crop(
//     //     image: widget.image,
//     //     controller: _controller,
//     //     aspectRatio: 1.1,
//     //     onCropped: (img) {
//     //       print(img);
//     //     });
//     // return Image.memory(widget.image);
//     return Cropper(
//       cropperKey: _cropperKey,
//       image: Image.memory(widget.image),
//       overlayType: OverlayType.circle,
//
//     );
//   }
//
// }