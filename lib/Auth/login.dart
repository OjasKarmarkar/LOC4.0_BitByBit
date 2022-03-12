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
                "Loc Hacks!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    foreground: Paint()..shader = linearGradient),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "hddgdgdfgjgjg\njgjghjghjgjgjgasasasasasas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // SizedBox(
              //   width: double.infinity,
              //   child: Obx(
              //     () => TextButton(
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 4),
              //         child: controller.showLoading.value
              //             ? spinkit
              //             : const Text(
              //                 'Login',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.bold),
              //                 textAlign: TextAlign.end,
              //               ),
              //       ),
              //       style: TextButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5.0),
              //         ),
              //         primary: Colors.white,
              //         backgroundColor: accentColor,
              //         onSurface: Colors.grey,
              //       ),
              //       onPressed: () {
              //         if (!controller.showLoading.value) {
              //           if (!phValidated) {
              //             showSnackbar("Error", " Incorrect Phone Number !");
              //           } else {
              //             controller.userExists(ph , true , null , null);
              //             // controller.signup(
              //             //     email.text, password.text, name.text);
              //           }
              //           // if (!validateEmail(email.text)) {
              //           //   showSnackbar(
              //           //       "Error!", "Please enter a valid email !");
              //           // } else if (password.text.isEmpty) {
              //           //   showSnackbar("Error", " Password cannot be empty!");
              //           // } else {
              //           //   controller.login(email.text, password.text);
              //           // }
              //           // Database().createValidateUser();
              //         }
              //       },
              //     ),
              //   ),
              // ),

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
                  const Text(
                    'New to Loc?',
                    style: TextStyle(color: Colors.black),
                    // textAlign: TextAlign.end,
                  ),
                  TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(color: accentColor),
                      // textAlign: TextAlign.end,
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      //  print(Get.isPlatformDarkMode);
                      Get.toNamed('/signup');
                    },
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
