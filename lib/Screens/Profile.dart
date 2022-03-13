import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loc/Const/activityModel.dart';
import 'package:loc/Controllers/appController.dart';
import 'package:loc/Widgets/wrapper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AppController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      "assets/images/home.svg",
                      height: 120,
                      // height: 24,
                      //idth: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Weekly Analysis'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      //title: ChartTitle(text: 'Weekly analysis'),
                      // Enable legend
                      legend: Legend(isVisible: false),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<ActivityData, String>>[
                        LineSeries<ActivityData, String>(
                            dataSource: controller.activity,
                            xValueMapper: (ActivityData sales, _) => sales.day,
                            yValueMapper: (ActivityData sales, _) =>
                                sales.timespent,
                            name: 'History',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () async {
                      controller.signOut();
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // prefs.clear();
                      // Get.offAll(OnBoarding());
                    },
                    leading: const CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        child: Icon(
                          FeatherIcons.loader,
                          size: 20,
                          color: Colors.white,
                        )),
                    trailing: Text('85 Kg'),
                    title: Text(
                      "Weight",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () async {
                      controller.signOut();
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // prefs.clear();
                      // Get.offAll(OnBoarding());
                    },
                    leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          FeatherIcons.database,
                          size: 20,
                          color: Colors.white,
                        )),
                    trailing: Text('6 ft'),
                    title: Text(
                      "Height",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () async {
                      controller.signOut();
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
      ),
    );
  }
}
