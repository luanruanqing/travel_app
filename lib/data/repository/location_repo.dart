import 'package:get/get.dart';
import 'package:travel_app/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/utils/app_constants.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getPopularLocationList() async{
    return await apiClient.getData(AppConstants.LOCATION_POPULAR_URI);
  }
}
