import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/dimensions.dart';

class BottomMenuBar extends StatelessWidget {
  const BottomMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;
    switch(ModalRoute.of(context)?.settings.name){
      case "profile-page":
        index = 0;
      // case "profile-page":
      //   index = 1;
      case "/":
        index = 2;
      // case "profile-page":
      //   index = 3;
      // case "profile-page":
      //   index = 4;
    }

    return CurvedNavigationBar(
      backgroundColor: AppColors.mainColor,
      index: index,
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.easeOut,
      items: [
        Icon(Icons.person_outline, size: Dimensions.font32,),
        Icon(Icons.favorite_outline, size: Dimensions.font32,),
        Icon(Icons.home, size: Dimensions.font32,color: AppColors.mainColor,),
        Icon(Icons.location_on_outlined, size: Dimensions.font32,),
        Icon(Icons.list, size: Dimensions.font32,),
      ],
      onTap: (index){
        switch(index){
          case 0:
            Get.toNamed(RouteHelper.getProfilePage());
          case 1:
            ShowCustomSnackBar(title: "Menu","Updating ...");
            // Get.toNamed(RouteHelper.getSignUp());
          case 2:
            Get.toNamed(RouteHelper.getInitial());
          case 3:
            ShowCustomSnackBar(title: "Menu","Updating ...");
            // Get.toNamed(RouteHelper.getOtpPage());
          case 4:
            ShowCustomSnackBar(title: "Menu","Updating ...");
        // Get.toNamed(RouteHelper.getAuthPage());
        }

      },
    );
  }
}
