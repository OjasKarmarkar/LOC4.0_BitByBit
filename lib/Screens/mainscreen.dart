import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:loc/Screens/Home.dart';
import 'package:loc/Screens/Leaderboard.dart';
import 'package:loc/Screens/Profile.dart';
import 'package:loc/Widgets/wrapper.dart';

import '../Controllers/appController.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  var nav = Get.put(AppController());
  //final dataController = Get.put(DataController());
  @override
  void initState() {
    super.initState();
    //  dataController.fetchCentres();
    _tabController = TabController(vsync: this, length: _listTabs.length);
    _tabController.animateTo(nav.index.value);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> _listTabs = [Home(), LeaderBoard(), Profile()];

  Widget _bottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: nav.index.value,
            onTap: (index) {
              nav.navigate(index);
              _tabController.animateTo(index);
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            iconSize: 25.0,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    FeatherIcons.home,
                    color: Colors.blue,
                  ),
                  icon: Icon(
                    FeatherIcons.home,
                    color: Colors.grey,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    FeatherIcons.trendingUp,
                    color: Colors.blue,
                  ),
                  icon: Icon(
                    FeatherIcons.trendingUp,
                    color: Colors.grey,
                  ),
                  label: "Leaderboard"),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    FeatherIcons.user,
                    color: Colors.blue,
                  ),
                  icon: Icon(
                    FeatherIcons.user,
                    color: Colors.grey,
                  ),
                  label: "Profile"),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: Scaffold(
          body: TabBarView(
            children: _listTabs,
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: _bottomNavigationBar()),
    );
  }
}
