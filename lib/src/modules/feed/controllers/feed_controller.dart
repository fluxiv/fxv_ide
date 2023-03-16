import 'package:flutter/material.dart';

class FeedController extends ChangeNotifier {
  bool hoverActive = false;
  late List hovers = [];

  void createHovers() {
    hovers.add({"hover": false});
    // notifyListeners();
  }

  void onHover(index, value) {
    // hoverActive = value;
    hovers[index]["hover"] = value;
    notifyListeners();
  }
}
