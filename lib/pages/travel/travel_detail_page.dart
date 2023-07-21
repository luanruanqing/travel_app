import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/controller/hotel_controller.dart';
import 'package:travel_app/controller/travel_controller.dart';

class TravelDetail extends StatelessWidget {
  final int pageId;
  final String page;
  TravelDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var travel = Get.find<TravelController>().popularTravelList[pageId];

    return Scaffold();
  }
}
