import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/custom/custom_button_submit.dart';
import 'package:flutter_login/custom/custom_form_input.dart';
import 'package:flutter_login/custom/custom_spiner.dart';
import 'package:flutter_login/custom/style.dart';
import 'package:flutter_login/providers/register_viewmodel.dart';
import 'package:flutter_login/screen/login_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PageRegister extends StatefulWidget {
  const PageRegister({super.key});
  static const routername = "/register";
  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _username = TextEditingController();

  late final TextEditingController _password = TextEditingController();

  final TextEditingController _repassword = TextEditingController();

  bool _isChecked = false;

  late bool _isValidEmail = false;
  late bool _isValidUsername = false;
  late bool _isValidPassword = false;
  late bool _isValidRepassword = false;

  // ignore: non_constant_identifier_names
  String _emailError = '';
  String _usernameError = '';
  String _passwordError = '';
  String _repasswordError = '';

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    // print(viewmodel.status);
    // ignore: non_constant_identifier_names
    void ValidatorForm() {
      setState(() {
        String email = _email.text.trim();
        String username = _username.text.trim();
        String password = _password.text.trim();
        String repassword = _repassword.text.trim();
        final bool emailValid =
            RegExp(r"^\b[A-Za-z0-9._%+-]+@gmail\.com\b").hasMatch(email);

        if (email.isEmpty) {
          _isValidEmail = true;
          _emailError = "Không được bỏ trống !";
        } else if (!emailValid) {
          _isValidEmail = true;
          _emailError = "Email không hợp lệ !";
        } else {
          _isValidEmail = false;
        }

        if (username.isEmpty) {
          _isValidUsername = true;
          _usernameError = "Không được bỏ trống !";
        } else if (username.length < 4) {
          _isValidUsername = true;
          _usernameError = "Tối thiểu 4 ký tự !";
        } else {
          _isValidUsername = false;
        }

        if (password.isEmpty) {
          _isValidPassword = true;
          _passwordError = "Không được bỏ trống !";
        } else if (password.length < 8) {
          _isValidPassword = true;
          _passwordError = "Tối thiểu 8 ký tự !";
        } else {
          _isValidPassword = false;
        }

        if (password != repassword && repassword.isNotEmpty) {
          _isValidRepassword = true;
          _repasswordError = "Mật khẩu không khớp !";
        } else if (repassword.isEmpty) {
          _isValidRepassword = true;
          _repasswordError = "Không được bỏ trống !";
        } else {
          _isValidRepassword = false;
        }

        if (!_isValidEmail &&
            !_isValidUsername &&
            !_isValidPassword &&
            !_isValidRepassword) {
          viewmodel.register(email, username, password, repassword);
        }
      });
    }

    return Scaffold(
      body:Container(
          height: double.infinity,
         
          child: Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.6),
        
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                            child: Stack(
                              children: [
                                viewmodel.status == 3 || viewmodel.status == 4
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Đăng ký thành công',
                                              style: TextStyle(
                                                  fontWeight:
                                                      StyleGlobal.fontWeight,
                                                  fontSize: 34),
                                            ),
                                            viewmodel.status == 3
                                                ? const Text(
                                                    'Bạn cần xác minh email để hoàn thành đăng ký ?')
                                                : const Text(''),
                                            viewmodel.status == 4
                                                ? RichText(
                                                    text: TextSpan(
                                                      text: 'Bấm vào đây ',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blue.shade400,
                                                          fontSize: 16),
                                                      recognizer: TapGestureRecognizer()
                                                        ..onTap = () => Navigator
                                                            .popAndPushNamed(
                                                                context,
                                                                PageLogin
                                                                    .routername),
                                                      children: const [
                                                        TextSpan(
                                                          text:
                                                              ' để đăng nhập !',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : const Text(''),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 200,
                                                width: 150,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'lib/assets/logo_register.png'),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              const Column(
                                                children: [
                                                  Text(
                                                    ' Welcome',
                                                    style: TextStyle(
                                                      fontSize: 34,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color.fromARGB(
                                                          255, 189, 87, 192),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Register Page',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          CusTom_Form_Input(
                                            labelForm: 'Username',
                                            textController: _username,
                                            textError: _usernameError,
                                            isValid: _isValidUsername,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                          ),
                                          CusTom_Form_Input(
                                            labelForm: 'Email',
                                            textController: _email,
                                            textError: _emailError,
                                            isValid: _isValidEmail,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                          ),
                                          CusTom_Form_Input(
                                            labelForm: 'Password',
                                            textController: _password,
                                            textError: _passwordError,
                                            isValid: _isValidPassword,
                                            obs: true,
                                            isObs: true,
                                          ),
                                          const SizedBox(height: 20),
                                          CusTom_Form_Input(
                                            labelForm: 'Re-password',
                                            textController: _repassword,
                                            textError: _repasswordError,
                                            isValid: _isValidRepassword,
                                            obs: true,
                                            isObs: true,
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Checkbox(
                                                fillColor: MaterialStateProperty
                                                    .resolveWith((states) {
                                                  if (!states.contains(
                                                      MaterialState.selected)) {
                                                    return const Color.fromARGB(
                                                        255, 241, 175, 170);
                                                  }
                                                  return null;
                                                }),
                                                value: _isChecked,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _isChecked = !_isChecked;
                                                    viewmodel.SetChecked(
                                                        _isChecked);
                                                  });
                                                },
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      'Chấp nhận điều khoản ? ',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: ' Điều khoản',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors
                                                            .blue.shade400,
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap =
                                                                () =>
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text(
                                                                            'Điều khoản sử dụng App ',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color.fromARGB(255, 211, 47, 101),
                                                                            ),
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                            viewmodel.dieukhoan,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                          shape:
                                                                              const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(2),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          viewmodel.status == 2
                                              ? Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  child: Text(
                                                    viewmodel.errorChecked,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(height: 20),
                                          InkWell(
                                            onTap: ValidatorForm,
                                            child: CusTom_ButtonSubmit(
                                              textButton: 'Register',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Already have an account ?',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                              children: [
                                                TextSpan(
                                                  text: ' Login',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blue.shade900,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () => Navigator
                                                            .popAndPushNamed(
                                                                context,
                                                                PageLogin
                                                                    .routername),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              viewmodel.status == 1 ? const Spiner() : Container(),
            ],
          ),
        ),      
    );
  }
}
