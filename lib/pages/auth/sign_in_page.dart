import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/pages/auth/sign_up_page.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/app_icon.dart';
import 'package:travel_app/widgets/app_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      try {
        String phone = phoneController.text.trim();
        String password = passwordController.text.trim();

        if (phone.isEmpty) {
          ShowCustomSnackBar("Type in your phone number",
              title: "Phone number");
        } else if (password.isEmpty) {
          ShowCustomSnackBar("Type in your password", title: "Password");
        } else if (password.length < 6) {
          ShowCustomSnackBar("Password can not be less than 6 characters",
              title: "Password");
        } else {
          authController.login(phone, password).then((status) {
            if (status.isSuccess) {
              Get.toNamed(RouteHelper.getInitial());
            } else {
              ShowCustomSnackBar(title: "Error user" ,status.message);
            }
          });
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                    "Sign in",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height60,
              ),
              AppTextField(
                textController: phoneController,
                hintText: "Phone number",
                icon: Icons.phone_outlined,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              AppTextField(
                isObscure:true,
                textController: passwordController,
                hintText: "Password",
                icon: Icons.lock_open_outlined,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Checkbox(
                      value: false,
                      onChanged: (bool) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeColor: AppColors.textColor2,
                      checkColor: Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Remember me",
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontSize: Dimensions.iconSize16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width30 * 2.5,
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Get.to(() => {}, transition: Transition.fade),
                        text: "Forgot password?",
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              GestureDetector(
                onTap: () {
                  _login(authController);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width30, right: Dimensions.width30),
                  width: Dimensions.screenWidth,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 / 2),
                    border: Border.all(
                      color: Color(0xff72635d),
                    ),
                    color: Color(0xff72635d),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
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
                    width: Dimensions.width30,
                  ),
                  Text(
                    "or sign in with",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: Dimensions.width30,
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
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
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
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      border: Border.all(
                        color: Color(0xff3014ba),
                      ),
                      color: Color(0xff3014ba),
                    ),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/facebook.png",color: AppColors.whiteColor,),
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
              SizedBox(
                height: Dimensions.height30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w500),
                  ),
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage(),
                            transition: Transition.fade),
                      text: "Sign Up",
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ):CustomLoader();
      }),
    );
  }
}
