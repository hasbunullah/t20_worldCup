import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_container extends StatelessWidget {
   custom_container({Key? key, required this.title, required this.image, required this.onTap}) : super(key: key);

  dynamic image;
  String title;
  dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), bottomLeft: Radius.circular(20.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5.r,
                blurRadius: 7.r,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(image),height: 100.h,),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
