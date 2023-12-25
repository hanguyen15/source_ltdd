import 'package:flutter/material.dart';

import 'package:flutter_login/models/hocphan.dart';
import 'package:flutter_login/providers/hocphandangky_viewmodel.dart';
import 'package:flutter_login/repositoties/hocphan_dangky_repository.dart';
import 'package:provider/provider.dart';

class HocPhanDangKyMenu extends StatelessWidget {
  const HocPhanDangKyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    HocPhanDangKyRepository().getHocPhanDangKy();
    return const HocPhanDangKyPage();
  }
}

class HocPhanDangKyPage extends StatelessWidget {
  const HocPhanDangKyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<HocPhanDangKyViewModel>(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Học Phần Đăng Ký',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 27, 146),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: FutureBuilder<List<HocPhanDangKy>>(
            future: viewmodel.getHocPhanDangKy(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                ); // Hiển thị loading khi đang fetch dữ liệu
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Xây dựng giao diện sử dụng dữ liệu từ API
                List<HocPhanDangKy> dataList = snapshot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // maxCrossAxisExtent: 200,
                      // childAspectRatio: 1,
                      crossAxisSpacing: 15, // Khoảng cách giữa các cột
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 84, 188, 236),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 15, 6, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    dataList[index].tenhocphan,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    dataList[index].tengv,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 8, 5, 173),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
