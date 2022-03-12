import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Screens/mainscreen.dart';
import '../Widgets/helper.dart';
import 'db.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var showLoading = false.obs;
  int forceResendToken = 0;
  String verificationID = '';
  var didResend = false.obs;
  static String email = '';
  static String name = '';
  static String photoUrl = '';
  var otpLoading = false.obs;
  void googleSignin() {
    Database().signInWithGoogle().then((value) {
      name = value.user?.displayName ?? "";
      email = value.user!.email!;
      photoUrl = value.user?.photoURL?? "";
      Database().getUser(value.user!.email!).then((v) {
        if (v != null) {
          box.write("uid", email);
          box.write("name", name);
          box.write("photo", photoUrl);
          Get.offAll(() => MainScreen());
        } else {
          Database().signup(email, name, photoUrl);
          box.write("uid", email);
          box.write("name", name);
          box.write("photo", photoUrl);
        }
      });
    }).catchError((err) {
      showSnackbar("Error", "Google Login Error ${err.toString()}");
      //Database().setLoginSignupLog("googleLogin", "", "", err);
    });
  }

  void saveToken(String? fcmtToken) {
    box.write("token", fcmtToken);
  }

  void displayLoading(bool value) {
    showLoading.value = value;
  }

  void signOut() {
    box.erase();
    //Get.offAll(() => Login());
  }
}
