import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/app_icon.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var phoneController = TextEditingController();
    // var passwordController = TextEditingController();

    // void _login(AuthController authController) {
    //   String phone = phoneController.text.trim();
    //   String password = passwordController.text.trim();
    //
    //   if (phone.isEmpty) {
    //     ShowCustomSnackBar("Type in your phone number",
    //         title: "Phone number");
    //   } else if (password.isEmpty) {
    //     ShowCustomSnackBar("Type in your password", title: "Password");
    //   } else if (password.length < 6) {
    //     ShowCustomSnackBar("Password can not be less than 6 characters",
    //         title: "Password");
    //   } else {
    //     authController.login(phone, password).then((status){
    //       if(status.isSuccess){
    //         Get.toNamed(RouteHelper.getInitial());
    //       }else{
    //         ShowCustomSnackBar(status.message);
    //       }
    //     });
    //   }
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading?SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Positioned(
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
                Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: Dimensions.font26,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ):const CustomLoader();
      }),
    );
  }
}
