import 'package:flutter/material.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/models/student.dart';
import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/repositoties/login_repository.dart';
import 'package:flutter_login/repositoties/student_repository.dart';
import 'package:flutter_login/repositoties/user_repository.dart';

class LoginViewModel with ChangeNotifier {
  String errorMessage = '';
  int status = 0;

  void logout() {
    Profile().token = '';
    notifyListeners();
  }

  LoginRepository loginRepository = LoginRepository();

  Future<void> login(String username, String password) async {
    status = 1;
    notifyListeners();
    try {
      var profile = await loginRepository.login(username, password);
      if (profile.token == '') {
        status = 2;
        errorMessage = "Đăng nhập thất bại !";
      } else {
        // đăng nhập thành công
        var students = await StudentRepository().getStudentInfo();
        profile.student = Student.fromStudent(students);
        var data = await UserRepository().getUserInfo();
        profile.user = User.fromUser(data);
        status = 3;
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
