// import 'package:flutter_login/models/profile.dart';

import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/services/api_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class UserRepository {
  final ApiService api = ApiService();
  Future<User> getUserInfo() async {
    User user = User();
    final response = await api.getUserInfo();
    if (response != null) {
      var json = response.data['data'];
      user = User.fromJson(json);
    }
    return user;
  }

  Future<bool> updateProfile() async {
    bool kq = false;
    var response = await api.updateProfile();
    if (response != null) {
      kq = true;
    }
    return kq;
  }

  Future<void> uploadAvatar(XFile image) async {
    ApiService api = ApiService();
    final img.Image originalImage =
        img.decodeImage(File(image.path).readAsBytesSync())!;
    final img.Image resizedImage = img.copyResize(originalImage, width: 300);
    final File resizedFile = File(image.path.replaceAll('.jpg', '_resized.jpg'))
      ..writeAsBytesSync(img.encodeJpg(resizedImage));
    await api.uploadAvatarToServer(File(resizedFile.path));
  }
}
