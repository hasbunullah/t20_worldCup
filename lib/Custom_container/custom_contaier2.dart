import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_container2 extends StatelessWidget {
  custom_container2(
      {Key? key,
      this.image1,
      required this.teamOne,
      required this.teamTwo,
      required this.image2,
      required this.venue,
      required this.date})
      : super(key: key);

  dynamic image1;
  String teamOne;
  String teamTwo;
  dynamic image2;
  String venue;
  String date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20.r)),
                ),
                height: 150.h,
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(image1),
                            radius: 25.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            teamOne,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: const Text(
                          'VS ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(image2),
                            radius: 25.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            teamTwo,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20.r)),
                ),
                height: 150.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$date GMT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text(
                        'Local',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        venue,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Image.asset(
          'icons/player.png',
          color: Colors.white,
          height: 50.h,
        ),
      ],
    );
  }
}
