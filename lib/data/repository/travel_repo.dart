import 'package:get/get.dart';
import 'package:travel_app/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/utils/app_constants.dart';

class TravelRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  TravelRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getPopularTravelList() async{
    return await apiClient.getData(AppConstants.TRAVEL_POPULAR_URI);
  }
}
