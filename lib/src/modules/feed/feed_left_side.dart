import 'package:flutter/material.dart';
import 'package:fxv_ide/src/modules/feed/widgets/pic_section_left.dart';

class FeedLeftSide extends StatelessWidget {
  const FeedLeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PicSection(),
        ],
      ),
    );
  }
}
