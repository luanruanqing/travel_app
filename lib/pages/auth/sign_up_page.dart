import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    void _registration(
        AuthController authController) {
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
            print("Success registration");
            Get.toNamed(RouteHelper.getInitial());
          } else {
            ShowCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController){
          return Stack(
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
              SizedBox(
                height: Dimensions.height60,
              ),
              Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.15,
                    ),
                    AppTextField(
                      textController: firstnameController,
                      hintText: "First name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    AppTextField(
                      textController: lastnameController,
                      hintText: "Last name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: Dimensions.height30,
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
                      textController: passwordController,
                      hintText: "Password",
                      icon: Icons.lock_open_outlined,
                    ),
                    GestureDetector(
                      onTap: () {
                        _registration(
                          authController
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.height60,
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
                    Text(
                      "Sign up with",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor2,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset("assets/images/google.png"),
                          ),
                          SizedBox(
                            width: Dimensions.width30,
                          ),
                          Container(
                            child: Image.asset("assets/images/facebook.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
