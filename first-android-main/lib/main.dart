import 'package:flutter/material.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/providers/diachi_viewmodel.dart';
import 'package:flutter_login/providers/forgot_viewmodel.dart';
import 'package:flutter_login/providers/hocphandangky_viewmodel.dart';
import 'package:flutter_login/providers/login_viewmodel.dart';
import 'package:flutter_login/providers/menubar_viewmodel.dart';
import 'package:flutter_login/providers/register_viewmodel.dart';
import 'package:flutter_login/providers/taikhoan_viewmodel.dart';
import 'package:flutter_login/screen/dashboard_page.dart';
import 'package:flutter_login/screen/forgot_page.dart';
// ignore: unused_import
import 'package:flutter_login/screen/landing_page.dart';
import 'package:flutter_login/screen/login_page.dart';
import 'package:flutter_login/screen/register_page.dart';
import 'package:flutter_login/services/api_services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService api = ApiService();
  api.initialize();
  Profile profile = Profile();
  profile.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<RegisterViewModel>(
          create: (context) => RegisterViewModel(),
        ),
        ChangeNotifierProvider<ForgotViewModel>(
          create: (context) => ForgotViewModel(),
        ),
        ChangeNotifierProvider<MenuBarViewModel>(
          create: (context) => MenuBarViewModel(),
        ),
        ChangeNotifierProvider<DiachiViewModel>(
          create: (context) => DiachiViewModel(),
        ),
        ChangeNotifierProvider<TaiKhoanViewModel>(
          create: (context) => TaiKhoanViewModel(),
        ),
        ChangeNotifierProvider<HocPhanDangKyViewModel>(
          create: (context) => HocPhanDangKyViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final viewmodel = Provider.of<LoginViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const PageLanding(),
        // '/': (context) => const PageDashBoard(),
        '/login': (context) => const PageLogin(),
        '/register': (context) => const PageRegister(),
        '/forgot': (context) => const PageForgot(),
        '/dashboard': (context) => const PageDashBoard(),
        //
      },
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(55, 151, 0, 1)),
        useMaterial3: true,
        fontFamily: 'monospace',
      ),
    );
  }
}
