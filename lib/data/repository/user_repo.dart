import 'package:get/get.dart';
import 'package:travel_app/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
