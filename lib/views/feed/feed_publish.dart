import 'package:flutter/material.dart';

class FeedPublish extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FeedPublishState();
  }

}
class FeedPublishState extends State<FeedPublish>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(10.0),
      color: Colors.yellow,
      alignment: Alignment.topCenter,

    );
  }

}