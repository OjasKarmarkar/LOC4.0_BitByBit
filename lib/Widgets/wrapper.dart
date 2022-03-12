import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget themeWrapper({required Widget child}) {
  if (Get.isDarkMode) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Color(0xff172A3A),
            systemNavigationBarColor: Color(0xff172A3A),
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
        child: child);
  } else {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        child: child);
  }
}

SystemUiOverlayStyle appBarStyle() {
  return  SystemUiOverlayStyle(
      statusBarBrightness: Get.isDarkMode?Brightness.dark : Brightness.light,
      statusBarColor: Get.isDarkMode?Color(0xff172A3A): Colors.white,
      systemNavigationBarColor: Get.isDarkMode?Color(0xff172A3A): Colors.white,
      systemNavigationBarIconBrightness:Get.isDarkMode?Brightness.light: Brightness.dark,
      statusBarIconBrightness: Get.isDarkMode?Brightness.light: Brightness.dark);
}
