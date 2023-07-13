import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    Timer(
      const Duration(seconds: 3),
          () => Get.offNamed(RouteHelper.getAuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: Dimensions.screenWidth,
            height: Dimensions.screenHeight / 1.65,
            child: Image.asset(
              "assets/images/image-10.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height60, right: Dimensions.width20 * 2),
              height: Dimensions.screenHeight / 2,
              width: Dimensions.screenWidth / 2,
              child: Image.asset(
                "assets/images/iphone-se-2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height80 * 5, left: Dimensions.width20 * 4),
              child: Text(
                "EXPLORE",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: Dimensions.font32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height80 * 5.8, left: Dimensions.width20 * 4),
              child: Text(
                "THE CITY",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: Dimensions.font20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
