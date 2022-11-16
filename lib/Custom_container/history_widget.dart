import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class history_screen extends StatelessWidget {
  history_screen(
      {Key? key,
      required this.captian1,
      required this.captian2,
      required this.winnerFlag,
      required this.runnerUpFlag,
      required this.winner,
      required this.runnerUp,
      required this.winnerScore,
      required this.runnerUpScore,
      required this.year,
      required this.host})
      : super(key: key);

  dynamic captian1;
  dynamic captian2;
  dynamic winnerFlag;
  dynamic runnerUpFlag;
  String winner;
  String runnerUp;
  String winnerScore;
  String runnerUpScore;
  String year;
  String host;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 300.w,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 70.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage(winnerFlag),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      winner,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
              CircleAvatar(
                radius: 30.r,
                child: const Text('VS'),
              ),
              Expanded(
                child: Container(
                  height: 70.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [

                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(
                          runnerUpFlag,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        runnerUp,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Winner',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    winnerScore,
                    style: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Runner Up',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    runnerUpScore,
                    style: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(captian1),
                fit: BoxFit.cover,
                height: 150.h,
                width: 100.w,
              ),
              Column(
                children: [
                  Text(
                    year,
                    style: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Image(
                    image: const AssetImage('images/trophy.png'),
                    fit: BoxFit.cover,
                    height: 100.h,
                    width: 70.w,
                  ),
                  SizedBox(height: 7.h,),
                  Text(
                    "Hosted By \n$host",
                    style: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Image(
                image: AssetImage(captian2),
                fit: BoxFit.cover,
                height: 160.h,
                width: 130.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
