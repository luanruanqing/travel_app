import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/controller/travel_controller.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:travel_app/utils/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _loadResource() async {
    await Get.find<TravelController>().getNearestTravelList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: _loadResource,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/menu.png",
                width: Dimensions.width30,
                color: AppColors.mainColor,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/pin.png",
                    width: Dimensions.width30,
                    color: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 5,
                  ),
                  Text(
                    'Vietnam',
                    style: TextStyle(
                      color: AppColors.textColor2,
                      fontSize: Dimensions.font16,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.mainColor,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius20 / 2),
                ),
                child: Image.asset(
                  "assets/icons/profile.png",
                  width: Dimensions.width20 * 2,
                ),
              ),
            ],
          ),
          centerTitle: false,
          backgroundColor: AppColors.whiteColor,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Discover",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: Dimensions.font32,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " the best Places to travel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/search.png",
                          width: Dimensions.width30,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Places',
                                hintStyle:
                                    TextStyle(color: AppColors.mainColor)),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/option.png",
                          width: Dimensions.width30,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearest to you",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor2,
                      ),
                    ),
                  ],
                ),
                GetBuilder<TravelController>(
                  builder: (nearestTravel) {
                    return nearestTravel.isLoaded
                        ? Container(
                            margin: EdgeInsets.only(top: Dimensions.height15),
                            height: size.height * 4,
                            child: ListView.builder(
                              itemCount: nearestTravel.nearestTravelList.length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: Dimensions.width15),
                                  child: GestureDetector(
                                    onTap: () => print("tapped"),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimensions.radius20)),
                                          child: Image.network(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOADS_URL +
                                                  nearestTravel
                                                      .nearestTravelList[index]
                                                      .images[index]
                                                      .imageUrl!),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : CircularProgressIndicator(
                            color: AppColors.mainColor,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
