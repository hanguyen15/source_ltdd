import 'package:flutter_login/models/hocphan.dart';
import 'package:flutter_login/models/lop.dart';
import 'package:flutter_login/models/student.dart';
import 'package:flutter_login/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static final Profile _instance = Profile._internal();

  factory Profile() {
    return _instance;
  }

  Profile._internal() {
    // initialization logic
  }

  late SharedPreferences _pref;
  late String? token;
  Student student = Student();
  User user = User();
  Lop lop = Lop();
  HocPhan hocphan = HocPhan();
  // ignore: prefer_typing_uninitialized_variables
  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
    token = '';
  }

  // ignore: non_constant_identifier_names
  Future<void> SetUserPassword(String username, String password) async {
    _pref.setString("username", username);
    _pref.setString("password", password);
  }

  String get username => _pref.getString("username") ?? '';
  String get password => _pref.getString("password") ?? '';
}
