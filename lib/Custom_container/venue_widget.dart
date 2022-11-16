import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class venue_widget extends StatelessWidget {
  venue_widget(
      {Key? key,
      required this.image,
      required this.country,
      required this.stadium,
      required this.city})
      : super(key: key);

  dynamic image;
  String country;
  String stadium;
  String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        height: 330.h,
        width: double.infinity,
        child: Stack(children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
                height: 230.h,
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                stadium,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                city,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Positioned(
            left: 100.w,
            right: 100.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),
                color: Colors.deepPurpleAccent,
              ),
              height: 30.h,
              width: 100.w,
              child: Center(
                  child: Text(
                country,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
