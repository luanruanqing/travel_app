import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/app_icon.dart';
import 'package:travel_app/widgets/app_otp_text_field.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldOneController = TextEditingController();
    var fieldTwoController = TextEditingController();
    var fieldThreeController = TextEditingController();
    var fieldFourController = TextEditingController();
    var fieldFiveController = TextEditingController();
    var fieldSixController = TextEditingController();
    final RxString phone = ''.obs;

    void _otp(AuthController authController) {
      try {
        String fieldOne = fieldOneController.text.trim();
        String fieldTwo = fieldTwoController.text.trim();
        String fieldThree = fieldThreeController.text.trim();
        String fieldFour = fieldFourController.text.trim();
        String fieldFive = fieldFiveController.text.trim();
        String fieldSix = fieldSixController.text.trim();

        if (fieldOne.isEmpty) {
          ShowCustomSnackBar("Type in field one", title: "Field one");
        } else if (fieldTwo.isEmpty) {
          ShowCustomSnackBar("Type in field two", title: "Field two");
        } else if (fieldThree.isEmpty) {
          ShowCustomSnackBar("Type in field three", title: "Field three");
        } else if (fieldFour.isEmpty) {
          ShowCustomSnackBar("Type in field four", title: "Field four");
        } else if (fieldFive.isEmpty) {
          ShowCustomSnackBar("Type in field five", title: "Field five");
        } else if (fieldSix.isEmpty) {
          ShowCustomSnackBar("Type in field six", title: "Field six");
        } else {
          String otp = fieldOne+fieldTwo+fieldThree+fieldFour+fieldFive+fieldSix;
          authController.otp(otp).then((status) {
            if (status.isSuccess) {
              Get.toNamed(RouteHelper.getSignIn());
            } else {
              ShowCustomSnackBar(title: "Confirm verity", status.message);
            }
          });
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(body: GetBuilder<AuthController>(builder: (authController) {
      return !authController.isLoading?SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: AppColors.textColor2,
                    backgroundColor: AppColors.whiteColor,
                    iconSize: Dimensions.iconSize32,
                  ),
                ),
                SizedBox(
                  width: Dimensions.screenWidth / 4,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: Dimensions.font26,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.width30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter code from SMS",
                    style: TextStyle(
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Dimensions.height30 / 2,
                  ),
                  Text(
                    "Enter code sent to your number",
                    style: TextStyle(
                        color: AppColors.textColor2,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Text(
                    "Send again OTP",
                    style: TextStyle(
                        color: AppColors.textColor2,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // Implement 4 input fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInput(fieldOneController, true),
                          OtpInput(fieldTwoController, false),
                          OtpInput(fieldThreeController, false),
                          OtpInput(fieldFourController, false),
                          OtpInput(fieldFiveController, false),
                          OtpInput(fieldSixController, false)
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      GestureDetector(
                        onTap: () {
                          _otp(authController);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.width30,
                              right: Dimensions.width30),
                          width: Dimensions.screenWidth,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            border: Border.all(
                              color: Color(0xff72635d),
                            ),
                            color: Color(0xffffffff),
                          ),
                          child: Center(
                            child: Text(
                              'Confirm code',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff72635d),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ):CustomLoader();
    }));
  }
}
