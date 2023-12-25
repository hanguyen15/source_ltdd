import 'dart:convert';

import 'package:flutter_login/models/lop.dart';
import 'package:flutter_login/services/api_services.dart';

class LopRepository {
  final ApiService api = ApiService();
  Future<List<Lop>> getDanhSachLop() async {
    List<Lop> list = [];
    list.add(Lop(ten: '----Chọn---'));
    var response = await api.getDanhSachLop();
    if (response != null) {
      var data = response.data['data'];
      for (var item in data) {
        var lop = Lop.fromJson(item);
        list.add(lop);
      }

      // Profile().student = Student.fromStudent(student);
    }
    return list;
  }

  Future<List<Dssv>> getDssv(int id) async {
    List<Dssv> list = [];
    var response = await api.getDsdv(id);
    if (response != null && response.data != null) {
      var data = response.data;
      List<dynamic> jsonList = json.decode(data);
      list = jsonList.map((json) => Dssv.fromJson(json)).toList();

      return list;
    }
    return [];
  }
}
