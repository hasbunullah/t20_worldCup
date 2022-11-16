import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:world_cup/Custom_container/custom_container.dart';
import 'package:world_cup/Screens/ScheduleScreen.dart';
import 'package:world_cup/Screens/history_screen.dart';
import 'package:world_cup/Screens/teamScreen.dart';
import 'package:world_cup/Screens/venueScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('T20 World Cup',),
                  backgroundColor: Colors.purpleAccent,
                ),
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/bg.jpeg"),
                    ),
                  ),
                  child: Column(
                    children: [
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: [
                          custom_container(
                              title: 'Schedule',
                              image: 'icons/schedule.png',
                              onTap: () {
                                Get.to(ScheduleScreen());
                              }),
                          custom_container(
                              title: 'Highlights',
                              image: 'icons/highlights.png',
                              onTap: () async {
                                const url =
                                    "http://www.youtube.com/c/ICC/featured";
                                await canLaunchUrl(Uri.parse(url))
                                    ? await launchUrl(Uri.parse(url))
                                    : throw "Could't load $url";
                              }),
                          custom_container(
                              title: 'Live score',
                              image: 'icons/live_score.png',
                              onTap: () async {
                                const url = "https://www.espncricinfo.com/";
                                await canLaunchUrl(Uri.parse(url))
                                    ? await launchUrl(Uri.parse(url))
                                    : throw "Could't load $url";
                              }),
                          custom_container(
                              title: 'History',
                              image: 'icons/history.png',
                              onTap: () {
                                Get.to(historyScreen());
                              }),
                          custom_container(
                              title: 'Teams',
                              image: 'icons/teams.png',
                              onTap: () {
                                Get.to(teamScreen());
                              }),
                          custom_container(
                              title: 'Venues',
                              image: 'icons/venues.png',
                              onTap: () {
                                Get.to(venueScreen());
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
