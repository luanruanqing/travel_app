import 'package:travel_app/base/show_custom_snackbar.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:get/get.dart';

class ApiChecker{
  static void checkApi(Response response){
    if(response.statusCode==401){
      // Get.offNamed(RouteHelper.getSignInPage());
    }else{
      ShowCustomSnackBar(response.statusText!);
    }
  }
}