import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_cup/Custom_container/teams_container.dart';
import '../UserModel.dart';

class teamScreen extends StatelessWidget {
  teamScreen({Key? key}) : super(key: key);

  var jsonData;

  Future<List<Teams>> getData(BuildContext context) async {
    var list = <Teams>[];
    var data = await rootBundle.loadString('assets/worldcup.json');
    var jsonData = await json.decode(data);
    var jsonSchedule = await jsonData['teams'];

    print(jsonData);

    for (Map i in jsonSchedule) {
      Teams match = Teams.fromJson(i);
      list.add(match);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Teams'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
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
                  FutureBuilder<List<Teams>>(
                    future: getData(context),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Teams> list = snapshot.data;
                        return ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                            itemBuilder: (context, index) {
                              return teams_container(
                                flageImage: list[index].flag,
                                teamName: list[index].fullName.toString(),
                                captianName: list[index].captain.toString(),
                                captainImage:  list[index].captainImage.toString(),
                              );
                            });
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
    );
  }
}
