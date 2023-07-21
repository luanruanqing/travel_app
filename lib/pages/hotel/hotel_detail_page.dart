import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/controller/hotel_controller.dart';
import 'package:travel_app/utils/appColors.dart';
import 'package:travel_app/utils/app_constants.dart';
import 'package:travel_app/utils/dimensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_app/widgets/star_rating.dart';

class HotelDetail extends StatelessWidget {
  final int pageId;
  final String page;

  HotelDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hotel = Get.find<HotelController>().bestDealHotelList[pageId];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.listViewImgSize * 5,
              child: CarouselSlider.builder(
                itemCount: hotel.images.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.network(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOADS_URL +
                        hotel.images[index].imageUrl!,
                    width: size.width,
                    fit: BoxFit.fill,
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 100),
                  viewportFraction: 0.8,
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height60,
            left: Dimensions.width20,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(Dimensions.width10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius20 / 2))),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height60,
            right: Dimensions.width20,
            child: GestureDetector(
              onTap: () {
                print(hotel.images.length);
              },
              child: Container(
                padding: EdgeInsets.all(Dimensions.width10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius20 / 2))),
                child: Center(
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * .6,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.whiteColor,
                    AppColors.whiteColor.withOpacity(.03)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            width: size.width * .9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StarRating(
                            rating: hotel.rating!,
                            color: AppColors.yellowColor,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            hotel.name!,
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            hotel.address!,
                            style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ ${hotel.price!}',
                            style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'per night',
                            style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            border: Border.all(
                              color: Color(0xff72635d),
                            ),
                            color: Color(0xff72635d),
                          ),
                          child: Center(
                            child: Text(
                              'Book now',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            border: Border.all(
                              color: Color(0xff72635d),
                            ),
                            color: Color(0xffffffff),
                          ),
                          child: Center(
                            child: Text(
                              'More details',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff72635d),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
