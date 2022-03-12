import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:loc/Controllers/appController.dart';
import 'package:loc/Widgets/wrapper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  onTap: () async {
                    // SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // prefs.clear();
                    // Get.offAll(OnBoarding());
                  },
                  leading: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Icon(
                        FeatherIcons.logOut,
                        size: 20,
                        color: Colors.white,
                      )),
                  title: Text(
                    "Logout",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
