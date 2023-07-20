import 'package:travel_app/data/repository/hotel_repo.dart';
import 'package:travel_app/data/repository/travel_repo.dart';
import 'package:get/get.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/models/travel_model.dart';

class HotelController extends GetxController implements GetxService {
  final HotelRepo hotelRepo;

  HotelController({required this.hotelRepo});

  List<HotelModel> _bestDealHotelList = [];

  List<HotelModel> get bestDealHotelList => _bestDealHotelList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getBestDealHotelList() async {
    try {
      Response response = await hotelRepo.getBestDealHotelList();
      if (response.statusCode == 200) {
        _bestDealHotelList = [];
        _bestDealHotelList.addAll(Hotel.fromJson(response.body).hotels);
        _isLoaded = true;
        update();
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
