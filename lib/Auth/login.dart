import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Const/colors.dart';
import '../Controllers/auth_controller.dart';
import '../Widgets/helper.dart';
import '../Widgets/wrapper.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthController controller = Get.put(AuthController());
  // late FirebaseMessaging messaging;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _passwordVisible = false;
  final TextEditingController phone = TextEditingController();
  String ph = '0';
  bool phValidated = false;

  @override
  void initState() {
    // messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((value) {
    //   controller.saveToken(value);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/first-ill.svg',
                height: 350,
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Fittastic",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    foreground: Paint()..shader = linearGradient),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Fitness has\nnever been so fantastic!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/images/google.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const Text(
                          'Login with Google',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    primary: Colors.white,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    controller.googleSignin();
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your ready-to-go Sports coach!',
                    style:
                        TextStyle(foreground: Paint()..shader = linearGradient),
                    // textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
