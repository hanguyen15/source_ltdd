import 'package:flutter_login/models/hocphan.dart';
import 'package:flutter_login/services/api_services.dart';

class HocPhanDangKyRepository {
  final ApiService api = ApiService();
  int kq = 1;
  Future<int> dangKyHocPhan(int id) async {
    var response = await api.dangKyHocPhan(id);
    if (response != null && response.statusCode == 200) {
      kq = 2;
    } else {
      kq = 3;
    }
    return kq;
  }

  Future<List<HocPhanDangKy>> getHocPhanDangKy() async {
    List<HocPhanDangKy> hocphandangky = [];
    var response = await api.getHocPhanDangKy();
    if (response != null && response.statusCode == 200) {
      var data = response.data['data'];
      for (var item in data) {
        var json = HocPhanDangKy.fromJson(item);
        hocphandangky.add(json);
      }
    }
    return hocphandangky;
  }
}
