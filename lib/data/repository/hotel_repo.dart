import 'package:get/get.dart';
import 'package:travel_app/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/utils/app_constants.dart';

class HotelRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  HotelRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getBestDealHotelList() async{
    return await apiClient.getData(AppConstants.HOTEL_BEST_DEAL_URI);
  }
}
