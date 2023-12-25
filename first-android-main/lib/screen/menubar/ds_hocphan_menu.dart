import 'package:flutter/material.dart';
import 'package:flutter_login/custom/custom_button_submit.dart';
import 'package:flutter_login/custom/style.dart';
import 'package:flutter_login/models/hocphan.dart';
import 'package:flutter_login/providers/hocphandangky_viewmodel.dart';
import 'package:flutter_login/repositoties/ds_hocphan_repository.dart';
import 'package:provider/provider.dart';

class HocPhanMenu extends StatelessWidget {
  const HocPhanMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const HocPhanPage();
  }
}

class HocPhanPage extends StatelessWidget {
  const HocPhanPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<HocPhanDangKyViewModel>(context);

    if (viewmodel.status == 2) {
      // Hiển thị thông báo khi điều kiện đúng
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final overlay = Overlay.of(context);
        final overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            top: 0.0,
            left: 0.0,
            child: Material(
              color: const Color.fromARGB(0, 255, 255, 255),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: AlertDialog(
                  title: const Text(
                    'Thông báo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 146, 34, 232),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    viewmodel.message,
                    style: StyleGlobal.h3,
                  ),
                ),
              ),
            ),
          ),
        );

        overlay.insert(overlayEntry);

        // Đóng thông báo sau 2 giây
        Future.delayed(const Duration(seconds: 2), () {
          overlayEntry.remove();
          viewmodel.status = 0;
        });
      });
    }
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Danh Sách Học Phần',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 27, 146),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: FutureBuilder<List<HocPhan>>(
            future: HocPhanRepository().getDsHocPhan(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                ); // Hiển thị loading khi đang fetch dữ liệu
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Xây dựng giao diện sử dụng dữ liệu từ API
                List<HocPhan> dataList = snapshot.data!;
                
                  return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // maxCrossAxisExtent: 200,
                      crossAxisSpacing: 15, // Khoảng cách giữa các cột
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 226, 91, 29),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 15, 6, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 8, 5, 173),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () async {
                                  await viewmodel
                                      .dangKyHocPhan(dataList[index].id);
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: CusTom_ButtonSubmit(
                                    textButton: 'Đăng ký',
                                    size: 20,
                                  ),
                                ),
                              )
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
