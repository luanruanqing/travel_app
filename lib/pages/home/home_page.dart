import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/base/custom_loader.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/controller/hotel_controller.dart';
import 'package:travel_app/controller/location_controller.dart';
import 'package:travel_app/controller/travel_controller.dart';
import 'package:travel_app/controller/user_controller.dart';
import 'package:travel_app/routes/route_helper.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:travel_app/widgets/bottom_menu_bar.dart';
import 'package:travel_app/widgets/navbar_menu.dart';
import 'package:travel_app/widgets/star_rating.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _loadResource() async {
    await Get.find<TravelController>().getPopularTravelList();
    await Get.find<LocationController>().getPopularLocationList();
    await Get.find<HotelController>().getBestDealHotelList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }

    return Scaffold(
      key: scaffoldKey,
      drawer: const Navbarmenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset(
                "assets/icons/menu.png",
                width: Dimensions.width30,
                color: AppColors.mainColor,
              ),
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
            GetBuilder<UserController>(
              builder: (userController) {
                return userLoggedIn
                    ? (userController.isLoading
                        ? GestureDetector(
                            onTap: () {
                              Get.offNamed(RouteHelper.getProfilePage());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius20 / 2),
                              ),
                              child: Image.network(
                                AppConstants.BASE_URL +
                                    AppConstants.UPLOADS_URL +
                                    userController.userModel.avatar!,
                                width: Dimensions.listViewImgSize * .4,
                              ),
                            ))
                        : const CustomLoader())
                    : const CustomLoader();
              },
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
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
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
                              hintStyle: TextStyle(color: AppColors.mainColor)),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Popular destination",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              GetBuilder<LocationController>(
                builder: (popularLocation) {
                  return popularLocation.isLoaded
                      ? Container(
                          margin: EdgeInsets.only(top: Dimensions.height15),
                          height: size.height * .17,
                          child: ListView.builder(
                            itemCount:
                                popularLocation.popularLocationList.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(right: Dimensions.width15),
                                child: GestureDetector(
                                  onTap: () => print(popularLocation
                                      .popularLocationList[index].id),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Dimensions.radius20)),
                                        child: Image.network(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOADS_URL +
                                              popularLocation
                                                  .popularLocationList[index]
                                                  .imageUrl!,
                                          width: Dimensions.listViewImgSize * 2,
                                          height: Dimensions.listViewImgSize,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          width: Dimensions.width30 * 4.5,
                                          margin: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              top: Dimensions.height10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.height30,
                                              vertical: Dimensions.width10 / 2),
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimensions.radius20 / 2),
                                            ),
                                          ),
                                          child: Text(
                                            popularLocation
                                                .popularLocationList[index]
                                                .name!,
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontSize: Dimensions.font20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Top to do",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              GetBuilder<TravelController>(
                builder: (popularTravel) {
                  return popularTravel.isLoaded
                      ? Container(
                          margin: EdgeInsets.only(top: Dimensions.height15),
                          height: size.height * .4,
                          child: ListView.builder(
                            itemCount: popularTravel.popularTravelList.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(right: Dimensions.width15),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RouteHelper.getHotelDetail(
                                        index, "home"));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Dimensions.radius20)),
                                        child: Image.network(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOADS_URL +
                                              popularTravel
                                                  .popularTravelList[index]
                                                  .images[0]
                                                  .imageUrl!,
                                          width:
                                              Dimensions.listViewImgSize * 1.45,
                                          height:
                                              Dimensions.listViewImgSize * 2,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      Text(
                                        popularTravel.popularTravelList[index]
                                            .destination!,
                                        style: TextStyle(
                                            fontSize: Dimensions.font16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.mainColor),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width30 * 6.5,
                                        child: Text(
                                          popularTravel.popularTravelList[index]
                                              .description!,
                                          style: TextStyle(
                                              fontSize: Dimensions.font16 * 0.7,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.mainBlackColor),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hotel Best deals",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              GetBuilder<HotelController>(
                builder: (hotelBestDeal) {
                  return hotelBestDeal.isLoaded
                      ? Container(
                          margin: EdgeInsets.only(top: Dimensions.height15),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: hotelBestDeal.bestDealHotelList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: Dimensions.height15),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.getHotelDetail(
                                          index, "home"));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                Dimensions.radius20 / 2),
                                            bottomLeft: Radius.circular(
                                                Dimensions.radius20 / 2),
                                          ),
                                          child: Image.network(
                                            AppConstants.BASE_URL +
                                                AppConstants.UPLOADS_URL +
                                                hotelBestDeal
                                                    .bestDealHotelList[index]
                                                    .images[0]
                                                    .imageUrl!,
                                            fit: BoxFit.fill,
                                            height: Dimensions.listViewImgSize *
                                                0.7,
                                            width: Dimensions.listViewImgSize,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Dimensions.width20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  hotelBestDeal
                                                      .bestDealHotelList[index]
                                                      .name!,
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.mainColor,
                                                      fontSize:
                                                          Dimensions.font20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                StarRating(
                                                  rating: hotelBestDeal
                                                      .bestDealHotelList[index]
                                                      .rating!,
                                                  color: AppColors.yellowColor,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              '\$ ${hotelBestDeal.bestDealHotelList[index].price!}',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .mainColor,
                                                            fontSize: Dimensions
                                                                .font20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' / per night',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .mainBlackColor,
                                                            fontSize: Dimensions
                                                                .font16,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
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
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
