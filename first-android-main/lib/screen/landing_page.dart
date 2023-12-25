import 'package:flutter/material.dart';
import 'package:flutter_login/custom/custom_button_submit.dart';
import 'package:flutter_login/custom/style.dart';
import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/screen/dashboard_page.dart';
import 'package:flutter_login/screen/login_page.dart';

// ignore: must_be_immutable
class PageLanding extends StatefulWidget {
  const PageLanding({
    super.key,
  });
  static const routername = "/";

  @override
  State<PageLanding> createState() => _PageLandingState();
}

class _PageLandingState extends State<PageLanding> {
  @override
  Widget build(BuildContext context) {
    final profile = Profile();

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/N.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.6),
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 500,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Image(
                                image: AssetImage('lib/assets/logo_home.png'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: StyleGlobal.fontWeight,
                                  color: Color.fromARGB(255, 47, 191, 231),
                                ),
                              ),
                              const Text(
                                "Are you ready!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: StyleGlobal.fontWeight,
                                  color: Color.fromARGB(255, 47, 191, 231),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "We will start now",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: StyleGlobal.fontWeight,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                  onTap: () => {
                                        setState(() {
                                          if (profile.token != "") {
                                            Navigator.popAndPushNamed(context,
                                                PageDashBoard.routername);
                                          } else {
                                            Navigator.popAndPushNamed(
                                                context, PageLogin.routername);
                                          }
                                        }),
                                      },
                                  child: CusTom_ButtonSubmit(
                                      textButton: "Get Started"))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
