import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loc/Widgets/wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/helper.dart';

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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: sportDetails['img'],
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    Positioned(
                        bottom: 40,
                        left: 30,
                        child: Text(
                          sportDetails['short_desc'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("About ${sportDetails['name']}",
                      style: TextStyle(
                        //color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(sportDetails['desc'],
                      style: TextStyle(fontSize: 15, color: Colors.black
                          //color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          )),
                ),
                sportDetails['ex'].isEmpty
                    ? Container()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: sportDetails['ex'].length,
                        itemBuilder: ((context, index) {
                          Map<String, dynamic> exrcse =
                              sportDetails['ex'][index];
                          return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.all(10),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        height: 150,
                                        width: 100,
                                        imageUrl: exrcse['img'],
                                        fit: BoxFit.fill,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(exrcse['name'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black
                                                  //color: Colors.white,
                                                  ,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              FeatherIcons.trendingUp,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("(${exrcse['reward']} xp)",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green
                                                  //color: Colors.white,
                                                  ,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              FeatherIcons.clock,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("${exrcse['duration']} mins",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey
                                                  //color: Colors.white,
                                                  ,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                minimumSize: Size(50, 30),
                                                alignment:
                                                    Alignment.centerLeft),
                                            child: Text(
                                              'Try it Now !',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  foreground: Paint()
                                                    ..shader = linearGradient),
                                            ),
                                            onPressed: () {
                                              print('Pressed');
                                            }),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        Row(
                                          children: [
                                            Text(
                                              "Watch on",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(),
                                                onPressed: () async {
                                                  if (await canLaunch(
                                                      exrcse['video']))
                                                    await launch(
                                                        exrcse['video']);
                                                  else
                                                    // can't launch url, there is some error
                                                    throw "Could not launch";
                                                },
                                                icon:
                                                    Icon(FeatherIcons.youtube)),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
