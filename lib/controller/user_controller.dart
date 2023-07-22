import 'package:get/get.dart';
import 'package:travel_app/data/repository/user_repo.dart';
import 'package:travel_app/models/response_model.dart';
import 'package:travel_app/models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  late UserModel _userModel;

  UserController({required this.userRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return responseModel;
  }
}
