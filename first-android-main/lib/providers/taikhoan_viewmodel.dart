import 'package:flutter/material.dart';
import 'package:flutter_login/repositoties/user_repository.dart';
import 'package:image_picker/image_picker.dart';

class TaiKhoanViewModel with ChangeNotifier {
  int status = 0;
  int updateAvatar = 0;
  // ignore: non_constant_identifier_names
  Future<void> uploadAvatar(XFile image) async {
    status = 1;

    await UserRepository().uploadAvatar(image);
    notifyListeners();
  }

  void setUpdateAvatar() {
    updateAvatar = 1;
    notifyListeners();
  }

  void updateScreen() {
    status = 0;
    notifyListeners();
  }

  void displaySpinner() {
    status = 1;
    notifyListeners();
  }

  void hideSpinner() {
    status = 0;
    notifyListeners();
  }
}
