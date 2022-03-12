import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loc/Widgets/wrapper.dart';

class SportDetail extends StatefulWidget {
  const SportDetail({Key? key}) : super(key: key);

  @override
  State<SportDetail> createState() => _SportDetailState();
}

class _SportDetailState extends State<SportDetail> {
  Map<String, dynamic> sportDetails = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              FeatherIcons.chevronLeft,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            sportDetails['name'],
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
        ),
      ),
    );
  }
}
