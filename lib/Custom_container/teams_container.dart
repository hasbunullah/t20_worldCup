import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class teams_container extends StatelessWidget {
  teams_container(
      {Key? key,
      required this.flageImage,
      required this.teamName,
      required this.captianName,
      required this.captainImage})
      : super(key: key);

  dynamic flageImage;
  String teamName;
  String captianName;
  dynamic captainImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.infinity,
      color: Colors.purpleAccent,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image(
                image: AssetImage(flageImage),
                height: 90.h,
                width: 110.w,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  captianName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 40.r,
              backgroundImage: AssetImage(captainImage),
            ),
          ],
        ),
      ),
    );
  }
}
