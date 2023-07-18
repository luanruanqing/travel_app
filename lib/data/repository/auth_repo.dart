import 'package:travel_app/data/api/api_client.dart';
import 'package:travel_app/models/signup_body_model.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.SIGN_UP_URI, signUpBody.toJson());
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "NONE";
  }

  Future<String> getPhone() async {
    return sharedPreferences.getString(AppConstants.PHONE) ?? "NONE";
  }

  Future<Response> login(String phone, String password) async {
    return await apiClient.postData(
        AppConstants.SIGN_IN_URI, {"phone_number": phone, "password": password});
  }

  Future<Response> otp(String phone, String otp) async {
    return await apiClient.postData(
        AppConstants.OTP_URI, {"phone_number": phone, "otp": otp});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserPhoneAndPassword(String phone, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, phone);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearShareData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = '';
    apiClient.updateHeader('');

    return true;
  }
}
