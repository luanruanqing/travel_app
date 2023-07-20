import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/controller/hotel_controller.dart';
import 'package:travel_app/controller/location_controller.dart';
import 'package:travel_app/controller/travel_controller.dart';
import 'package:travel_app/data/api/api_client.dart';
import 'package:travel_app/data/repository/auth_repo.dart';
import 'package:travel_app/data/repository/hotel_repo.dart';
import 'package:travel_app/data/repository/location_repo.dart';
import 'package:travel_app/data/repository/travel_repo.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL,sharedPreferences: Get.find()));

  // Repo
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => TravelRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => HotelRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => TravelController(travelRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => HotelController(hotelRepo: Get.find()));

}