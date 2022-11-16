import 'package:flutter/material.dart';
import 'package:world_cup/Custom_container/venue_widget.dart';
import 'package:world_cup/UserModel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../UserModel.dart';

class venueScreen extends StatelessWidget {
  venueScreen({Key? key}) : super(key: key);

  var jsonData;

  Future<List<Venues>> getData(BuildContext context) async {
    var list = <Venues>[];
    var data = await rootBundle.loadString('assets/worldcup.json');
    var jsonData = await json.decode(data);
    var jsonSchedule = await jsonData['venues'];

    print(jsonData);

    for (Map i in jsonSchedule) {
      Venues match = Venues.fromJson(i);
      list.add(match);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Venues'),
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
                  FutureBuilder<List<Venues>>(
                    future: getData(context),
                    builder: (context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        List<Venues> list = snapshot.data;
                        return ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                const Divider(),
                            itemBuilder: (context, index) {
                              return venue_widget(
                                image: list[index].image,
                                country: "${list[index].country}",
                                stadium: "${list[index].stadium}",
                                city: "${list[index].city}",
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
