import 'package:get/get.dart';
import 'package:travel_app/pages/auth/auth_page.dart';
import 'package:travel_app/pages/auth/otp_page.dart';
import 'package:travel_app/pages/auth/sign_in_page.dart';
import 'package:travel_app/pages/auth/sign_up_page.dart';
import 'package:travel_app/pages/splash/splash_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String authPage = "/auth-page";
  static const String signUp = "/sign-up";
  static const String signIn = "/sign-in";
  static const String otpPage = "/otp-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getAuthPage() => '$authPage';
  static String getSignIn() => '$signIn';
  static String getSignUp() => '$signUp';
  static String getOtpPage() => '$otpPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
      name: initial,
      page: () {
        return const AuthScreen();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: authPage,
      page: () {
        return const AuthScreen();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: signIn,
      page: () {
        return const SignInPage();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: otpPage,
      page: () {
        return const OtpPage();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: signUp,
      page: () {
        return const SignUpPage();
      },
      transition: Transition.fade,
    ),
  ];
}