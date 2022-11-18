import 'package:flutter/material.dart';

class FeedContainer extends StatefulWidget{
  const FeedContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeedContainerState();
  }

}
class FeedContainerState extends State<FeedContainer>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
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