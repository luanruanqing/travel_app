import 'package:travel_app/data/repository/travel_repo.dart';
import 'package:get/get.dart';
import 'package:travel_app/models/travel_model.dart';

class TravelController extends GetxController implements GetxService {
  final TravelRepo travelRepo;
  TravelController({required this.travelRepo});
  List<TravelModel> _popularTravelList = [];
  List<TravelModel> get popularTravelList => _popularTravelList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularTravelList() async {
    try {
      Response response = await travelRepo.getPopularTravelList();
      if (response.statusCode == 200) {
        _popularTravelList = [];
        _popularTravelList.addAll(Travel
            .fromJson(response.body)
            .travels);
        _isLoaded = true;
        update();
      } else {}
    }catch (e){
      print(e);
    }
  }

}
