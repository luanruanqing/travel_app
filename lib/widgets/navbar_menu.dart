import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/controller/user_controller.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:travel_app/utils/dimensions.dart';

class Navbarmenu extends StatelessWidget {
  const Navbarmenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }

    return Drawer(
        backgroundColor: AppColors.whiteColor,
        child: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        UserAccountsDrawerHeader(
                          accountName: Text(
                              '${userController.userModel.fName} ${userController.userModel.lName}'),
                          accountEmail: Text(
                              userController.userModel.email ??
                                  "Add your email"),
                          currentAccountPicture: CircleAvatar(
                            child: ClipOval(
                              child: Image.network(AppConstants.BASE_URL +
                                  AppConstants.UPLOADS_URL +
                                  userController.userModel.avatar!),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/bg_avatar.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColors.mainColor,
                          ),
                          title: Text(
                            "Wallet",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          onTap: () {
                            print("updating");
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.send_outlined,
                            color: AppColors.mainColor,
                          ),
                          title: Text(
                            "Send Feedback",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          onTap: () {
                            print("updating");
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.star_border_outlined,
                            color: AppColors.mainColor,
                          ),
                          title: Text(
                            "Rate Our App",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          onTap: () {
                            print("updating");
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.support_outlined,
                            color: AppColors.mainColor,
                          ),
                          title: Text(
                            "View Support",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          onTap: () {
                            print("updating");
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.notifications_active_outlined,
                            color: AppColors.mainColor,
                          ),
                          title: Text(
                            "Notification",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          onTap: () {
                            print("updating");
                          },
                        ),
                        SizedBox(height: Dimensions.height30*1.5,),
                        ListTile(
                          leading: Icon(
                            Icons.logout_outlined,
                            color: AppColors.mainColor,
                          ),
                          title: Text(
                            "Log out",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          onTap: () {
                            if(Get.find<AuthController>().userLoggedIn()){
                              Get.find<AuthController>().clearShareData();
                              Get.offNamed(RouteHelper.authPage);
                            }
                          },
                        ),
                      ],
                    )
                    : const CustomLoader())
                : const CustomLoader();
          },
        ));
  }
}
