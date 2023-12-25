import 'package:flutter/material.dart';
import 'package:flutter_login/repositoties/register_repository.dart';

class RegisterViewModel with ChangeNotifier {
  String errorMessage = '';
  int status = 0;
  // ignore: unused_field
  bool _isChecked = false;
  String errorChecked = '';
  // ignore: non_constant_identifier_names
  void SetChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  // final registerrepository = RegisterRepository();
  String dieukhoan =
      "Có một số điều khoản :\n 1.Bạn chưa triển khai ứng dụng nào\n 2.Bạn có thể đã triển khai một thư mục trống.\n 3.Đây là miền tùy chỉnh nhưng chúng tôi vẫn chưa thiết lập xong.";
  RegisterRepository registerrepository = RegisterRepository();
  Future<void> register(
      String email, String username, String password, String repassword) async {
    status = 1;
    notifyListeners();
    if (_isChecked == false) {
      errorChecked = "Bạn chưa chấp nhận điều khoản ?";
      status = 2;
    } else {
      status = await registerrepository.register(email, username, password);
      if (status == 2) {
        errorChecked = "Người dùng đã tồn tại !";
      }
    }

    notifyListeners();
  }
}
