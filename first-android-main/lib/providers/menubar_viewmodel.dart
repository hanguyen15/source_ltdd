import 'package:flutter/material.dart';

class MenuBarViewModel with ChangeNotifier {
  int selected = 0;
  // ignore: non_constant_identifier_names
  void SetSelected(int value) {
    selected = value;
    notifyListeners();
  }
}
