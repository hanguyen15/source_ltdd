import 'package:flutter/material.dart';
import 'package:flutter_login/custom/style.dart';
import 'package:flutter_login/models/lop.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/repositoties/lop_repository.dart';

class DanhSachLopMenu extends StatelessWidget {
  const DanhSachLopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const DanhSachLopPage();
  }
}

class DanhSachLopPage extends StatelessWidget {
  const DanhSachLopPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Danh Sách Lớp',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 27, 146),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: FutureBuilder<List<Dssv>>(
            future: LopRepository().getDssv(Profile().student.idlop),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                ); // Hiển thị loading khi đang fetch dữ liệu
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Xây dựng giao diện sử dụng dữ liệu từ API
                List<Dssv> dataList = snapshot.data!;
                return Column(
                  children: [
                    Text(
                      'Tổng SV : ${dataList.length}',
                      style: StyleGlobal.h3,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 74, 196, 241),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height - 200,
                      width: double.infinity,
                      child: GridView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: 6,
                          crossAxisSpacing: 15, // Khoảng cách giữa các cột
                          mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                        ),
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(6, 15, 6, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          dataList[index].mssv,
                                          style: const TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          dataList[index].first_name,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 7, 22, 231),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
