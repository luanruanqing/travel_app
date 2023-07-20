import 'package:get/get.dart';
import 'package:travel_app/data/repository/location_repo.dart';
import 'package:travel_app/models/location_model.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  List<LocationModel> _popularLocationList = [];
  List<LocationModel> get popularLocationList => _popularLocationList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularLocationList() async {
    try {
      Response response = await locationRepo.getPopularLocationList();
      if (response.statusCode == 200) {
        _popularLocationList = [];
        _popularLocationList.addAll(Location
            .fromJson(response.body)
            .locations);
        _isLoaded = true;
        update();
      } else {}
    }catch (e){
      print(e);
    }
  }

}
