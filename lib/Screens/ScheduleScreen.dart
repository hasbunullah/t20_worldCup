import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_cup/Custom_container/custom_contaier2.dart';
import '../UserModel.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  var jsonData;

  Future<List<Schedule>> getData(BuildContext context) async {
    var list = <Schedule>[];

    var data = await rootBundle.loadString('assets/worldcup.json');
    var jsonData = await json.decode(data);
    var jsonSchedule = await jsonData['schedule'];

    for (Map i in jsonSchedule) {
      Schedule match = Schedule.fromJson(i);
      list.add(match);
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpeg"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<Schedule>>(
                    future: getData(context),
                    builder: (context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        List<Schedule> list = snapshot.data;
                        return ListView.separated(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: list.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            return custom_container2(
                              image1: "flags/${list[index].flagOne}",
                              teamOne: list[index].teamOne.toString(),
                              teamTwo: list[index].teamTwo.toString(),
                              image2: "flags/${list[index].flagTwo}",
                              venue: list[index].venue.toString(),
                              date: list[index].date.toString(),
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
