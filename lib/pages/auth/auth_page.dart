import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/pages/auth/sign_up_page.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/AppColors.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/utils/string.dart';
import 'package:travel_app/widgets/big_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(
            left: Dimensions.width30, right: Dimensions.width30),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.1,
            ),
            Container(
              child: Text(
                Strings.slogan1,
                style: TextStyle(
                  fontSize: Dimensions.font26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.005,
            ),
            Container(
              child: Text(
                Strings.slogan2,
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.1,
            ),
            Container(
              width: Dimensions.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignIn());
                    },
                    child: Container(
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
                    height: Dimensions.height60,
                  ),
                  Container(
                    child: Text(
                      Strings.slogan3,
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage(),
                            transition: Transition.fade),
                      text: "Register now",
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignUp());
                    },
                    child: Container(
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
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Text(
              "Sign up with",
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.w700,
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
                    child: Image.asset("assets/images/facebook.png",color: AppColors.textColor2,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
