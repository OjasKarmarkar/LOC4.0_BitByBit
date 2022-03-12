import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../Const/colors.dart';

bool validateEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Password mismatch';
  } else if (confirmPassword?.length == 0) {
    return "Confirm Password Can't be empty";
  } else {
    return null;
  }
}

Widget hideShowPassword(bool obscure, VoidCallback c) {
  return IconButton(
      padding: EdgeInsets.all(0),
      icon: Icon(
        // Based on passwordVisible state choose the icon
        obscure ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: c);
}

const spinkit = SpinKitThreeBounce(
  color: Colors.white,
  size: 24.0,
);

showGetDialog(String title, String message) {
  Get.defaultDialog(
    radius: 10,
    textCancel: "Okay",
    cancelTextColor: accentColor,
    buttonColor: accentColor,
    contentPadding: EdgeInsets.all(10),
    title: title,
    content: Text(message),
  );
}

showSnackbar(String type, String content) {
  Get.snackbar(type, content);
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xfffb558b), Color(0xff505edc)],
).createShader(Rect.fromLTWH(0.0, 100.0, 200.0, 70.0));

bool masterSwitch(dynamic value) {
  if (value == 1) {
    return true;
  }
  return false;
}

bool handle(dynamic obj, String field) {
  try {
    obj?.get(field);
    return true;
  } catch (e) {
    return false;
  }
}

String noOfDevices(dynamic arr) {
  if (arr != null) {
    if (arr.length > 1) {
      return "${arr.length.toString()} Devices";
    }
    return "${arr.length.toString()} Device";
  } else {
    return "No Devices";
  }
}
