import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_cup/Custom_container/history_widget.dart';
import '../UserModel.dart';

class historyScreen extends StatelessWidget {
  historyScreen({Key? key}) : super(key: key);

  var jsonData;

  Future<List<History>> getData(BuildContext context) async {
    var list = <History>[];

    var data = await rootBundle.loadString('assets/worldcup.json');
    var jsonData = await json.decode(data);
    var jsonSchedule = await jsonData['history'];

    print(jsonData);

    for (Map i in jsonSchedule) {
      History match = History.fromJson(i);
      list.add(match);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.jpeg"),
              fit: BoxFit.cover),
        ),
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
                    FutureBuilder<List<History>>(
                      future: getData(context),
                      builder: (context, AsyncSnapshot snapshot) {
                        print(snapshot.data);
                        if (snapshot.hasData) {
                          List<History> list = snapshot.data;
                          return ListView.separated(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: list.length,
                            separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                            itemBuilder: (context, index) {
                              return history_screen(
                                captian1: list[index].winnerCaptain,
                                captian2: list[index].runnerUpCaptain,
                                winnerFlag:"flags/${list[index].winnerFlag}",
                                runnerUpFlag:"flags/${list[index].runnerUpFlag}",
                                winner: list[index].winner.toString(),
                                runnerUp:list[index].runnerUp.toString() ,
                                winnerScore: list[index].winnerScore.toString(),
                                runnerUpScore: list[index].runnerUpScore.toString(),
                                year: list[index].year.toString(),
                                host: list[index].host.toString(),
                              );
                            },
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //Container(
    //   color: Colors.orange,
    // );
  }
}
