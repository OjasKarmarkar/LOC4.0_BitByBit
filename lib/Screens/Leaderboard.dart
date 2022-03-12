import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loc/Controllers/appController.dart';
import 'package:loc/Controllers/db.dart';
import 'package:loc/Widgets/wrapper.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/leaderboard.svg',
                    height: 300,
                    width: double.infinity,
                  ),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: Database().leaderboardStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.docs.isEmpty
                              ? Container()
                              : ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Text('${index + 1}#'),
                                      title: Text(
                                          snapshot.data?.docs[index]['name']),
                                      trailing: Text(
                                        "${snapshot.data?.docs[index]['levelXp']} Xp",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      thickness: 1.2,
                                    );
                                  },
                                );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        }
                        return Text("No Users !");
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
