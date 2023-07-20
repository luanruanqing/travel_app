import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/data/repository/auth_repo.dart';
import 'package:travel_app/models/response_model.dart';
import 'package:travel_app/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/app_constants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    authRepo.savePhoneNumber(signUpBody.phone.toString());
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String phone, String password) async {
    authRepo.getUserToken();
    _isLoading = true;
    update();
    Response response = await authRepo.login(phone, password);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> otp(String otp) async {
    authRepo.getUserToken();
    _isLoading = true;
    update();
    String? phone = await authRepo.getPhoneNumber();
    Response response = await authRepo.otp(phone!, otp);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.body["message"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserPhoneAndPassword(String phone, String password) {
    authRepo.saveUserPhoneAndPassword(phone, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearShareData(){
    return authRepo.clearShareData();
  }
}
