class Lop {
  int id;
  String ten;
  int idkhoa;
  int trangthai;
  Lop({
    this.id = 0,
    this.ten = "",
    this.idkhoa = 0,
    this.trangthai = 0,
  });
  factory Lop.fromJson(Map<String, dynamic> json) {
    return Lop(
      id: json['id'],
      ten: json['ten'],
      idkhoa: json['idkhoa'],
      trangthai: json['trangthai'],
    );
  }
  factory Lop.fromLop(Lop lop) {
    return Lop(
      id: lop.id,
      ten: lop.ten,
      idkhoa: lop.idkhoa,
      trangthai: lop.trangthai,
    );
  }
}

class Dssv {
  String mssv;
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  Dssv({this.mssv = '', this.first_name = ''});
  factory Dssv.fromJson(Map<String, dynamic> json) {
    return Dssv(
      mssv: json['mssv'] ?? '',
      first_name: json['first_name'] ?? '',
    );
  }
}
