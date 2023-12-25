import 'package:flutter/material.dart';
import 'package:flutter_login/custom/custom_button_submit.dart';
import 'package:flutter_login/custom/custom_dropdow.dart';
import 'package:flutter_login/custom/custom_text_field.dart';
import 'package:flutter_login/custom/style.dart';
import 'package:flutter_login/models/lop.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/repositoties/lop_repository.dart';
import 'package:flutter_login/repositoties/student_repository.dart';
import 'package:flutter_login/repositoties/user_repository.dart';

class PageDangKyLop extends StatefulWidget {
  const PageDangKyLop({super.key});
  static const routername = '/dangkylop';

  @override
  State<PageDangKyLop> createState() => _PageDangKyLopState();
}

class _PageDangKyLopState extends State<PageDangKyLop> {
  Profile profile = Profile();
  List<Lop>? listlop = [];
  String ten = '';
  int iduser = 0;
  int idLop = 0;
  String tenLop = '';
  String mssv = '';
  @override
  void initState() {
    ten = profile.user.firstName;
    iduser = profile.student.iduser;
    idLop = profile.student.idlop;
    tenLop = profile.student.tenlop;
    mssv = profile.student.mssv;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Thêm Thông Tin Cơ Bản',
                  style: TextStyle(
                    color: StyleGlobal.color,
                    fontSize: 30,
                    fontWeight: StyleGlobal.fontWeight,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Bạn không thể quay lại trang này sau khi rời khỏi )',
                  style: TextStyle(
                    color: Color.fromARGB(255, 250, 84, 84),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                CusTom_TextField(
                  width: size.width,
                  title: 'Tên',
                  value: ten,
                  callback: (output) {
                    ten = output;
                  },
                ),
                CusTom_TextField(
                  width: size.width,
                  title: 'Mssv:',
                  value: mssv,
                  callback: (output) {
                    mssv = output;
                  },
                ),
                listlop!.isEmpty
                    ? FutureBuilder(
                        future: LopRepository().getDanhSachLop(),
                        builder: (context, AsyncSnapshot<List<Lop>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            listlop = snapshot.data;
                            return CusTom_DropDown(
                              width: size.width,
                              title: 'Lớp',
                              valueId: idLop,
                              valueName: tenLop,
                              callback: (outputId, outputName) {
                                idLop = outputId;
                                tenLop = outputName;
                              },
                              list: listlop!,
                            );
                          } else {
                            return const Text('Error');
                          }
                        },
                      )
                    : CusTom_DropDown(
                        width: size.width,
                        title: 'Lớp',
                        valueId: idLop,
                        valueName: tenLop,
                        callback: (outputId, outputName) {
                          idLop = outputId;
                          tenLop = outputName;
                        },
                        list: listlop!,
                      ),
                InkWell(
                  onTap: () async {
                    profile.student.mssv = mssv;
                    profile.student.idlop = idLop;
                    profile.student.tenlop = tenLop;
                    profile.user.firstName = ten;
                    await UserRepository().updateProfile();
                    await StudentRepository().dangKyLop();
                  },
                  child: CusTom_ButtonSubmit(textButton: 'Lưu Thông Tin'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'Rời khỏi trang >>',
                  style: StyleGlobal.redirect,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types

// ignore: camel_case_types
