class HocPhan {
  int id;
  int iduser;
  String tenhocphan;
  String tengv;
  HocPhan(
      {this.id = 0, this.iduser = 0, this.tenhocphan = '', this.tengv = ''});
  factory HocPhan.fromJson(Map<String, dynamic> json) {
    return HocPhan(
      id: json['id'] ?? 0,
      iduser: json['iduser'] ?? 0,
      tenhocphan: json['tenhocphan'] ?? '',
      tengv: json['tengv'] ?? '',
    );
  }
}

class HocPhanDangKy {
  int id;
  int idsinhvien;
  int iduser;
  String tenhocphan;
  String tengv;
  HocPhanDangKy(
      {this.id = 0,
      this.iduser = 0,
      this.tenhocphan = '',
      this.tengv = '',
      this.idsinhvien = 0});
  factory HocPhanDangKy.fromJson(Map<String, dynamic> json) {
    return HocPhanDangKy(
      id: json['id'] ?? 0,
      iduser: json['iduser'] ?? 0,
      idsinhvien: json['idsinhvien'],
      tenhocphan: json['tenhocphan'] ?? '',
      tengv: json['tengv'] ?? '',
    );
  }
}
