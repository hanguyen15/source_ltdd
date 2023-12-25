import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/custom/custom_button_submit.dart';
import 'package:flutter_login/custom/custom_form_input.dart';
import 'package:flutter_login/custom/custom_spiner.dart';
import 'package:flutter_login/providers/login_viewmodel.dart';
import 'package:flutter_login/screen/dashboard_page.dart';
import 'package:flutter_login/screen/forgot_page.dart';
import 'package:flutter_login/screen/register_page.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});
  static const routername = "/login";
  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _usernameError = '';
  String _passwordError = '';
  bool _isValidUsername = false;
  bool _isValidPassword = false;

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);

    void ValidatorForm(context) {
      setState(() {
        String username = _usernameController.text.trim();
        String password = _passwordController.text.trim();

        if (username.isEmpty) {
          _isValidUsername = true;
          _usernameError = "Username cannot be empty!";
        } else {
          _isValidUsername = false;
        }

        if (password.isEmpty) {
          _isValidPassword = true;
          _passwordError = "Password cannot be empty!";
        } else {
          _isValidPassword = false;
        }

        if (username.isNotEmpty && password.isNotEmpty) {
          viewmodel.login(username, password);
        }
      });
    }

    if (viewmodel.status == 3) {
      Future.delayed(Duration.zero, () {
        Navigator.popAndPushNamed(context, PageDashBoard.routername);
      });
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      'Login Page',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage('lib/assets/logo_login.jpg'),
                    ),
                    const SizedBox(height: 20),
                    CusTom_Form_Input(
                      labelForm: 'Username',
                      textController: _usernameController,
                      textError: _usernameError,
                      isValid: _isValidUsername,
                    ),
                    const SizedBox(height: 20),
                    CusTom_Form_Input(
                      labelForm: 'Password',
                      textController: _passwordController,
                      textError: _passwordError,
                      isValid: _isValidPassword,
                      obs: true,
                      isObs: true,
                    ),
                    if (viewmodel.status == 2)
                      Container(
                        height: 20,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          viewmodel.errorMessage,
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context, PageForgot.routername);
                      },
                      child: const Text(
                        'Lấy lại mật khẩu',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () => ValidatorForm(context),
                      child: CusTom_ButtonSubmit(
                        textButton: 'Login',
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.popAndPushNamed(
                                  context, PageRegister.routername),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          viewmodel.status == 1 ? const Spiner() : const SizedBox(),
        ],
      ),
    );
  }
}
