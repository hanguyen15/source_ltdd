import 'package:flutter/material.dart';
import 'package:flutter_login/repositoties/forgot_repository.dart';

class ForgotViewModel with ChangeNotifier {
  String errorMessage = '';
  int status = 0;

  // final forgotrepository = ForgotRepository();

  ForgotRepository forgotrepository = ForgotRepository();
  Future<void> forgot(String email) async {
    status = 1;
    notifyListeners();
    if (status != 2) {
      final response = await forgotrepository.forgot(email);
      if (response) {
        status = 3;
      } else {
        status = 2;
        errorMessage = "Email không có trên hệ thống !";
      }
    }
    notifyListeners();
  }
}
