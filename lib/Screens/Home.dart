import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loc/Controllers/appController.dart';
import 'package:loc/Controllers/db.dart';
import 'package:loc/Screens/Sport.dart';
import 'package:loc/Widgets/wrapper.dart';

import '../Widgets/helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              controller.name?.split(" ")[0] ?? "John Doe",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: controller.photo == ""
                      ? SvgPicture.asset('assets/images/user.svg')
                      : CachedNetworkImage(
                          imageUrl: controller.photo!,
                        ),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: Database().userStream(controller.uid),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Text(r"Let's Have",
                          style: new TextStyle(
                            fontSize: 24.0,
                            //fontWeight: FontWeight.bold,
                            // foreground: Paint()..shader = linearGradient),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Text(
                        r"Some Activity !",
                        maxLines: 1,
                        style: new TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Overview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(FeatherIcons.barChart2)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: TweenAnimationBuilder<double>(
                                            tween: Tween<double>(
                                                begin: 0.0, end: 0.8),
                                            duration: const Duration(
                                                milliseconds: 1500),
                                            builder: (context, value, _) =>
                                                CircularProgressIndicator(
                                                  color: Color(0xff3c3f69),
                                                  strokeWidth: 8,
                                                  value: value,
                                                )),
                                      ),
                                      Text(
                                        "Lvl ${snapshot.data?.get('levelXp')}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${snapshot.data?.get('levelXp')} xp",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: TweenAnimationBuilder<double>(
                                            tween: Tween<double>(
                                                begin: 0.0, end: 1),
                                            duration: const Duration(
                                                milliseconds: 3500),
                                            builder: (context, value, _) =>
                                                CircularProgressIndicator(
                                                  color: Color(0xffe45c00),
                                                  strokeWidth: 8,
                                                  value: value,
                                                )),
                                      ),
                                      Text(
                                        "${snapshot.data?.get('streak')} 🔥",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Streak",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => controller.sports.isEmpty
                          ? Container()
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sports",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(FeatherIcons.target)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 200, // card height
                                  child: PageView.builder(
                                    itemCount: controller.sports.length,
                                    controller:
                                        PageController(viewportFraction: 0.8),
                                    onPageChanged: (int index) =>
                                        setState(() => _index = index),
                                    itemBuilder: (_, i) {
                                      return InkWell(
                                        onTap: () => Get.to(() => SportDetail(),
                                            arguments: controller.sports[i]),
                                        child: Transform.scale(
                                            scale: i == _index ? 1 : 0.9,
                                            child: Stack(
                                              children: [
                                                Card(
                                                  semanticContainer: true,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller
                                                        .sports[i]['img'],
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 5,
                                                  margin: EdgeInsets.all(10),
                                                ),
                                                Positioned(
                                                    bottom: 40,
                                                    left: 30,
                                                    child: Text(
                                                      controller.sports[i]
                                                          ['short_desc'],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        shadows: <Shadow>[
                                                          Shadow(
                                                            offset: Offset(
                                                                1.0, 1.0),
                                                            blurRadius: 3.0,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                          Shadow(
                                                            offset: Offset(
                                                                1.0, 1.0),
                                                            blurRadius: 8.0,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                // ClipRRect(
                                                //   // Clip it cleanly.
                                                //   child: BackdropFilter(
                                                //       filter: ImageFilter.blur(
                                                //           sigmaX: 2, sigmaY: 2),
                                                //       child: Container(
                                                //         height: 200,
                                                //         width: 200,
                                                //         color: Colors.grey
                                                //             .withOpacity(0.1),
                                                //         alignment: Alignment.center,
                                                //         child: Text(controller
                                                //             .sports[i]['name']),
                                                //       )),
                                                // )
                                              ],
                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
