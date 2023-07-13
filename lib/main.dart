import 'package:flutter/material.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/AppColors.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter App Travel Simple',
          // home: SignInPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
            fontFamily: "Roboto",
          ),
        );
  }
}
