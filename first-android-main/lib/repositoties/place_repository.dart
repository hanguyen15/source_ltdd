import 'package:flutter_login/models/place.dart';
import 'package:flutter_login/services/api_services.dart';

class PlaceRepository {
  Future<List<City>> getCity() async {
    List<City> list = [];
    list.add(City(id: 0, name: '----Chọn---'));
    var datas = await ApiService().getCity();
    if (datas != null) {
      for (var item in datas) {
        var city = City.fromJs(item);
        list.add(city);
      }
    }
    return list;
  }

  Future<List<District>> getDistrict(int id) async {
    List<District> list = [];
    list.add(District(id: 0, name: '----Chọn---', level: 0));
    var datas = await ApiService().getDistrict(id);
    if (datas != null) {
      for (var item in datas) {
        var district = District.fromJs(item);
        list.add(district);
      }
    }
    return list;
  }

  Future<List<Ward>> getWard(int id) async {
    List<Ward> list = [];
    list.add(Ward(id: 0, name: '----Chọn---'));
    var datas = await ApiService().getWard(id);
    if (datas != null) {
      for (var item in datas) {
        var ward = Ward.fromJs(item);
        list.add(ward);
      }
    }
    return list;
  }
}
