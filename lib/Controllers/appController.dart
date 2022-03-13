import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:loc/Auth/login.dart';
import 'package:loc/Const/activityModel.dart';
import 'package:loc/Const/diet_model.dart';
import 'package:loc/Controllers/db.dart';

class AppController extends GetxController {
  var index = 0.obs;

  final box = GetStorage();
  String? uid;
  String? name;
  String? photo;
  Diet? myDiet = Diet();
  Map<String, dynamic>? userData;
  RxList<dynamic> sports = [].obs;
  RxList<ActivityData> activity = <ActivityData>[].obs;

  @override
  void onInit() {
    //getUpdateDiet();
    getUID();
    getUserDetails();
    allSports();
    //getUserDetails();
    super.onInit();
  }

  void navigate(int i) => index.value = i;

  // void clearAll() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.clear().then((value) {
  //     exit(0);
  //   });
  // }

  getUserDetails() async {
    userData = await Database().getUser(uid!);

    for (int i = 0; i < userData?['activity'].length; i++) {
      var date = DateTime.fromMicrosecondsSinceEpoch(
          userData?['activity'][i]['history']['date'].microsecondsSinceEpoch);
      ActivityData data = ActivityData(DateFormat('EEEE').format(date),
          userData?['activity'][i]['history']['timeSpent']);
      activity.add(data);
      // print(activity);
    }
  }

  // }

  getUID() async {
    uid = GetStorage().read('uid');
    name = GetStorage().read('name') ?? '';
    photo = GetStorage().read('photo') ?? '';
  }

  void allSports() {
    try {
      Database().sports().then((value) {
        for (int i = 0; i < value.docs.length; i++) {
          sports.add(value.docs[i].data());
        }
        update();
      });
    } catch (e) {}
  }

  getUpdateDiet() {
    Database().fetchDiet().then((value) {
      myDiet = value;
    }).catchError((e) {
      print('e');
    });
    update();
  }

  // saveUser(String uID, String name, String imgurl) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   print(uID);
  //   await preferences.setString('uID', uID);
  //   await preferences.setString('name', name);
  //   await preferences.setString('image', imgurl);
  //   await preferences.setBool('seen', true);
  // }

  // Future<int> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   final UserCredential authResult =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   final User user = authResult.user;

  //   if (user != null) {
  //     print(user.uid);
  //     saveUser(user.uid, user.displayName, user.photoURL);
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    Database().signOutGoogle();
    box.erase();
    Get.offAll(Login());
  }
}
