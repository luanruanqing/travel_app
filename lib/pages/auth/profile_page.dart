import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/controller/user_controller.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/bottom_menu_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainColor,
                size: Dimensions.iconSize32,
              ),
            ),
            Text(
              "Profile",
              style: TextStyle(
                color: AppColors.mainBlackColor,
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.w900,
              ),
            ),
            GestureDetector(
              onTap: () {
                ShowCustomSnackBar(title: "Updating", "menu");
              },
              child: Icon(
                isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                // LineAwesomeIcons.sun,
                color: AppColors.mainColor,
                size: Dimensions.iconSize32,
              ),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return userLoggedIn
              ? (userController.isLoading
                  ? SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.width30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Dimensions.width30 * 4,
                                  height: Dimensions.height120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20 * 5),
                                    child: Image.network(AppConstants.BASE_URL +
                                        AppConstants.UPLOADS_URL +
                                        userController.userModel.avatar!),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${userController.userModel.fName} ${userController.userModel.lName}',
                                  style: TextStyle(
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height45,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  userController.userModel.email!,
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                              ),
                              width: size.width, // Adjust the width of the line
                              height: 2.0, // Adjust the height of the line
                              color: AppColors.mainColor, // Line color
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Phone",
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '${userController.userModel.phoneNumber}',
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                              ),
                              width: size.width, // Adjust the width of the line
                              height: 2.0, // Adjust the height of the line
                              color: AppColors.mainColor, // Line color
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date of birth",
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '${userController.userModel.dateOfBirth}',
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                              ),
                              width: size.width, // Adjust the width of the line
                              height: 2.0, // Adjust the height of the line
                              color: AppColors.mainColor, // Line color
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '${userController.userModel.address}',
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                              ),
                              width: size.width, // Adjust the width of the line
                              height: 2.0, // Adjust the height of the line
                              color: AppColors.mainColor, // Line color
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Account",
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      LineAwesomeIcons.lightning_bolt,
                                      color: AppColors.yellowColor,
                                    ),
                                    const Text("Gold"),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height60,),
                            GestureDetector(
                              onTap: () {
                                if(Get.find<AuthController>().userLoggedIn()){
                                  Get.find<AuthController>().clearShareData();
                                  Get.offNamed(RouteHelper.authPage);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: Dimensions.width30, right: Dimensions.width30),
                                width: size.width * 1.2,
                                height: size.height * .07,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                                  border: Border.all(
                                    color: Color(0xff72635d),
                                  ),
                                  color: Color(0xff72635d),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign out',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const CustomLoader())
              : const CustomLoader();
        },
      ),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
