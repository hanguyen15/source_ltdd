// import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/models/student.dart';
import 'package:flutter_login/services/api_services.dart';

class StudentRepository {
  final ApiService api = ApiService();

  Future<bool> dangKyLop() async {
    bool kq = false;
    var response = await api.dangKyLop();
    if (response != null) {
      kq = true;
    }
    return kq;
  }

  Future<Student> getStudentInfo() async {
    Student student = Student();
    var response = await api.getStudentInfo();
    if (response != null) {
      var data = response.data;
      student = Student.fromJson(data);
      // Profile().student = Student.fromStudent(student);
    }
    return student;
  }
}
