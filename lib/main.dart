import 'package:flutter/material.dart';
import 'package:travel_app/controller/location_controller.dart';
import 'package:travel_app/controller/travel_controller.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/AppColors.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as root;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await root.init();
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
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        fontFamily: "Roboto",
      ),
    );
  }
}
