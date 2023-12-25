import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    // initialization logic
  }
  // ignore: unused_field
  late Dio _dio = Dio();
  // ignore: non_constant_identifier_names
  final url_login = "https://chocaycanh.club/public/api/login";
  // ignore: non_constant_identifier_names
  final url_register = "https://chocaycanh.club/public/api/register";
  // ignore: non_constant_identifier_names
  final url_forgot = "https://chocaycanh.club/public/api/password/remind";
  // ignore: non_constant_identifier_names
  final url_getStudentInfo = "https://chocaycanh.club/public/api/sinhvien/info";
  // ignore: non_constant_identifier_names
  final url_getUserInfo = "https://chocaycanh.club/api/me";
  // ignore: non_constant_identifier_names
  final url_dslh = "https://chocaycanh.club/api/lophoc/ds";
  // ignore: non_constant_identifier_names
  final url_updateProfile = "https://chocaycanh.club/api/me/details";
  // ignore: non_constant_identifier_names
  final url_dangKyLop = "https://chocaycanh.club/api/lophoc/dangky";
  // ignore: non_constant_identifier_names
  final url_getcity = 'https://chocaycanh.club/public/api/getjstinh';
  // ignore: non_constant_identifier_names

  void initialize() {
    _dio = Dio(BaseOptions(responseType: ResponseType.json));
  }

  Future<Response?> getDsdv(int id) async {
    var urlgetdssv = 'https://chocaycanh.club/api/lophoc/dssinhvien';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    Map<String, dynamic> param = {
      "idlophoc": Profile().student.idlop,
    };
    try {
      var response = await _dio.post(
        urlgetdssv,
        data: jsonEncode(param),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<Response?> getHocPhanDangKy() async {
    const urlgetDkhp = 'https://chocaycanh.club/api/hocphan/dsmechung';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    try {
      var response = await _dio.get(
        urlgetDkhp,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<Response?> dangKyHocPhan(int id) async {
    final urlDkhp = 'https://chocaycanh.club/api/hocphan/dangky?idhocphan=$id';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    try {
      var response = await _dio.post(
        urlDkhp,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<Response?> getDsHocPhan() async {
    const urlDshocphan = 'https://chocaycanh.club/api/hocphan/ds';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    try {
      var response = await _dio.get(
        urlDshocphan,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> uploadAvatarToServer(File imageFile) async {
    // ignore: unused_local_variable
    var urlAvatar = 'https://chocaycanh.club/public/api/me/avatar';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
    };

    try {
      FormData formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(imageFile.path)});

      await _dio.post(
        urlAvatar,
        data: formData,
        options: Options(headers: headers),
      );
    } catch (e) {
      return;
    }
    return;
  }

  Future<List<dynamic>?> getCity() async {
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(url_getcity), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<dynamic>?> getDistrict(int id) async {
    var urlGetdistrict =
        'https://chocaycanh.club/public/api/getjshuyen?id=${id.toString()}';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse(urlGetdistrict), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<dynamic>?> getWard(int id) async {
    // ignore: unused_local_variable
    var urlGetward =
        'https://chocaycanh.club/public/api/getjsxa?id=${id.toString()}';
    // ignore: unused_local_variable
    Profile profile = Profile();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
    };
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(urlGetward), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<Response?> dangKyLop() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    Map<String, dynamic> param = {
      "id": Profile().student.idlop,
      "mssv": Profile().student.mssv,
    };

    try {
      final response = await _dio.post(
        url_dangKyLop,
        data: jsonEncode(param),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: empty_catches
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('Error: $e');
        // ignore: avoid_print
        print(e.message);
        // ignore: avoid_print
        print(e.error);
      }
    }
    return null;
  }

  Future<Response?> updateProfile() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(Profile().user.birthday);

    // Format the date to the desired format
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    Map<String, dynamic> param = {
      "first_name": Profile().user.firstName,
      "last_name": Profile().user.lastName,
      "phone": Profile().user.phone,
      "address": Profile().user.address,
      "provinceid": Profile().user.provinceid,
      "provincename": Profile().user.provincename,
      "districtid": Profile().user.districtid,
      "districtname": Profile().user.districtname,
      "wardid": Profile().user.wardid,
      "wardname": Profile().user.wardname,
      "street": "",
      "birthday": formattedDate,
    };
    try {
      final response = await _dio.patch(
        url_updateProfile,
        data: jsonEncode(param),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: empty_catches
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<Response?> getDanhSachLop() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
      // "Access-Control-Allow-Origin": "*",
    };
    try {
      final response = await _dio.get(
        url_dslh,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: empty_catches
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<Response?> getStudentInfo() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
    };
    try {
      final response = await _dio.get(
        url_getStudentInfo,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: empty_catches
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<Response?> getUserInfo() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer ${Profile().token}',
      "Accept": "application/json",
    };
    try {
      final response = await _dio.get(
        url_getUserInfo,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: empty_catches
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<Response?> loginUser(String username, String password) async {
    Map<dynamic, dynamic> param = {
      "username": username,
      "password": password,
      "device_name": "android"
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
    };

    try {
      final response = await _dio.post(url_login,
          data: jsonEncode(param), options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response;
      }
      // ignore: empty_catches
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<Response?> registerUser(
    String email,
    String username,
    String password,
  ) async {
    Map<dynamic, dynamic> param = {
      "email": email,
      "username": username,
      "password": password,
      "password_confirmation": password,
      "tos": "true"
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
    };

    try {
      final response = await _dio.post(url_register,
          data: jsonEncode(param), options: Options(headers: headers));
      if (response.statusCode == 201) {
        return response;
      }
    } catch (e) {
      // ignore: avoid_print
      if (e is DioException) {
        // ignore: avoid_print
        print(e.response);
      }
    }
    return null;
  }

  Future<Response?> forgotPassword(
    String email,
  ) async {
    Map<dynamic, dynamic> param = {"email": email};

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
    };

    try {
      final response = await _dio.post(url_forgot,
          data: jsonEncode(param), options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      // ignore: avoid_print
      if (e is DioException) {
        // ignore: avoid_print
        print(e.response);
      }
    }
    return null;
  }
}
