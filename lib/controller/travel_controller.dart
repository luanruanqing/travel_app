import 'package:travel_app/data/repository/travel_repo.dart';
import 'package:get/get.dart';
import 'package:travel_app/models/travel_model.dart';

class TravelController extends GetxController implements GetxService {
  final TravelRepo travelRepo;
  TravelController({required this.travelRepo});
  List<TravelModel> _nearestTravelList = [];
  List<TravelModel> get nearestTravelList => _nearestTravelList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getNearestTravelList() async {
    Response response = await travelRepo.getNearestTravelList();
    if (response.statusCode == 200) {
      _nearestTravelList = [];
      _nearestTravelList.addAll(Travel.fromJson(response.body).travels);
      _isLoaded = true;
      print(_isLoaded);
      update();
    }else{}
  }

}
