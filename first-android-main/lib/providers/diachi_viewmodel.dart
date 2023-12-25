import 'package:flutter/material.dart';
import 'package:flutter_login/models/place.dart';
import 'package:flutter_login/repositoties/place_repository.dart';

class DiachiViewModel with ChangeNotifier {
  List<City> listCity = [];
  List<District> listDistrict = [];
  List<Ward> listWard = [];
  // ignore: non_constant_identifier_names
  int CurCityID = 0;
  // ignore: non_constant_identifier_names
  int CurDistrictID = 0;
  // ignore: non_constant_identifier_names
  int CurWardID = 0;
  String address = "";
  // ignore: non_constant_identifier_names
  Future<void> initialize(int Cid, int Did, int Wid) async {
    CurCityID = Cid;
    CurDistrictID = Did;
    CurWardID = Wid;
    final repo = PlaceRepository();
    listCity = await repo.getCity();
    if (CurCityID != 0) {
      listDistrict = await repo.getDistrict(CurCityID);
    }
    if (CurDistrictID != 0) {
      listWard = await repo.getWard(CurDistrictID);
    }
  }

  Future<void> setCity(int id) async {
    if (id != CurCityID) {
      CurCityID = id;
      CurDistrictID = 0;
      CurWardID = 0;
      final repo = PlaceRepository();
      listDistrict = await repo.getDistrict(CurCityID);
    }
  }

  Future<void> setDistrict(int id) async {
    if (id != CurDistrictID) {
      CurDistrictID = id;
      CurWardID = 0;
      final repo = PlaceRepository();
      listWard = await repo.getWard(CurDistrictID);
    }
  }

  // Future<void> setWard(int id) async {
  //   if (id != CurDistrictID) {
  //     CurWardID = id;
  //   }
  // }
}
