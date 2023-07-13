import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/app_icon.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height60,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    iconSize: Dimensions.iconSize32,
                  ),
                ),
                SizedBox(
                  width: Dimensions.screenWidth / 4,
                ),
                Container(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
