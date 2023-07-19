import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/models/signup_body_model.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/app_icon.dart';
import 'package:travel_app/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstnameController = TextEditingController();
    var passwordController = TextEditingController();
    var lastnameController = TextEditingController();
    var phoneController = TextEditingController();

    void _register(AuthController authController) {
      String firstname = firstnameController.text.trim();
      String lastname = lastnameController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (firstname.isEmpty) {
        ShowCustomSnackBar("Type in your first name", title: "First name");
      } else if (password.isEmpty) {
        ShowCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        ShowCustomSnackBar("Password can not be less than 6 characters",
            title: "Password");
      } else if (lastname.isEmpty) {
        ShowCustomSnackBar("Type in your last name", title: "Last name");
      } else if (phone.isEmpty) {
        ShowCustomSnackBar("Type in your phone number", title: "Phone number");
      } else {
        SignUpBody signUpBody = SignUpBody(
          firstname: firstname,
          lastname: lastname,
          phone: phone,
          password: password,
        );
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getOtpPage());
          } else {
            ShowCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading?SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
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
                AppTextField(
                  textController: firstnameController,
                  hintText: "First name",
                  icon: Icons.person,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                AppTextField(
                  textController: lastnameController,
                  hintText: "Last name",
                  icon: Icons.person,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                AppTextField(
                  textController: phoneController,
                  hintText: "Phone number",
                  icon: Icons.phone_outlined,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                AppTextField(
                  isObscure:true,
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.lock_open_outlined,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Text(
                  "By tapping sign up you agree to the Terms and",
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor2,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Text(
                  "Condition and Privacy Policy of this app",
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _register(authController);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.height30,
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
                        'Sign up',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width30),
                      child: Image.asset(
                        "assets/icons/line.png",
                        width: Dimensions.screenWidth * 0.2,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    Text(
                      "or sign up with",
                      style: TextStyle(
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.width30),
                      child: Image.asset(
                        "assets/icons/line.png",
                        width: Dimensions.screenWidth * 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width30),
                      width: Dimensions.screenWidth / 2.5,
                      height: Dimensions.screenHeight / 13,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        border: Border.all(
                          color: AppColors.buttonbackgroundColor,
                        ),
                        color: AppColors.buttonbackgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google.png"),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.width30),
                      width: Dimensions.screenWidth / 2.5,
                      height: Dimensions.screenHeight / 13,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        border: Border.all(
                          color: Color(0xff3014ba),
                        ),
                        color: Color(0xff3014ba),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/facebook.png",
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ):CustomLoader();
      }),
    );
  }
}
