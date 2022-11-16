import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:world_cup/Screens/homeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/splashScreen/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.white,
          nextScreen: const homeScreen(),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.scaleTransition,
        ),
      ),
  );
}
