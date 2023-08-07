import 'package:adres/commons/appcolors.dart';
import 'package:adres/commons/common_widgets/base_widgets.dart';
import 'package:adres/commons/common_widgets/mytext_widgets.dart';
import 'package:adres/commons/common_widgets/storytag_widgets.dart';
import 'package:adres/commons/constants.dart';
import 'package:adres/commons/imagepath.dart';
import 'package:adres/commons/strings.dart';
import 'package:adres/languages/language.dart';
import 'package:adres/screens/Settings/setting_screen.dart';
import 'package:adres/screens/home_flow/home_screen/home_controller.dart';
import 'package:adres/screens/home_flow/hoteldetail_screen/hoteldetail_screen.dart';
import 'package:adres/screens/home_flow/map_screen/map_controller.dart';
import 'package:adres/screens/home_flow/map_screen/map_screen.dart';
import 'package:adres/screens/home_flow/notification_screen/notification_screen.dart';
import 'package:adres/screens/home_flow/search_screen/search_screen.dart';
import 'package:adres/screens/signup_flow/createaccount_screen/craeteaccount_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../commons/common_widgets/login_user_dialog.dart';
import '../../../commons/get_storage_data.dart';
import '../../../models/commandata_response_model.dart';
import '../bottom_screen/bottom_screen.dart';

var changing = false;

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const routes = "/HomeScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return BaseScreen(
          backgroundColor: AppColors().white,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.px),
                  bottomRight: Radius.circular(20.px),
                ),
                child: controller.userLocationLat != null && controller.userLocationLng != null
                    ? GoogleMap(
                        mapType: MapType.terrain,
                        onMapCreated: controller.onMapCreated,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: CameraPosition(
                            target: LatLng(controller.userLocationLat!, controller.userLocationLng!), zoom: 17),
                        onTap: (argument) {
                          controller.hotelDetail.value = false;
                          controller.update();
                        },
                        onCameraMove: (latLng) {
                          EasyDebounce.debounce('my-debouncer', Duration(milliseconds: 500), () {
                            controller.getHome(lat: latLng.target.latitude, lng: latLng.target.longitude);
                          });
                        },
                        compassEnabled: false,
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: false,
                      )
                    : SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55.px, left: 10.px, right: 10.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48.px,
                          width: 48.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors().white,
                            border: Border.all(color: controller.appColors.appColor),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors().introBlack.withOpacity(0.3),
                                offset: const Offset(
                                  0.0,
                                  0.0,
                                ),
                                blurRadius: 15.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (GetStorageData().containKey(GetStorageData().loginData)) {
                                Get.toNamed(CreateAccountScreen.routes, arguments: Strings.profile);
                              } else {
                                loginUserDialog();
                              }
                            },
                            child: controller.imgUrl.value != ""
                                ? ClipOval(
                                    // borderRadius: BorderRadius.circular(15.px),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.imgUrl.value,
                                      placeholder: (context, url) =>
                                          Container(color: AppColors().bottomSheetBackground.withOpacity(0.8)),
                                      errorWidget: (context, url, error) => Image.asset(ImagePath.userIcon),
                                      fit: BoxFit.cover,
                                      height: 45.px,
                                      width: 45.px,
                                    ),
                                  )
                                : Image.asset(
                                    ImagePath.userIcon,
                                    height: 45.px,
                                  ),
                          ),
                        ),
                        SizedBox(width: 10.px),
                        GestureDetector(
                          onTap: () {
                            controller.hotelDetail.value = false;
                            controller.update();
                            Get.toNamed(SearchScreen.routes);
                          },
                          child: Container(
                            height: 45.px,
                            width: 45.px,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors().white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors().introBlack.withOpacity(0.3),
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 15.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Image.asset(
                              ImagePath.icSearch,
                              height: 25.px,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 38.px,
                          width: 126.px,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(40.px),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors().introBlack.withOpacity(0.3),
                                offset: const Offset(
                                  0.0,
                                  0.0,
                                ),
                                blurRadius: 15.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: MyTextView(
                            controller.locationCity.value,
                            textStyleNew: MyTextStyle(
                              textSize: 16.px,
                              textWeight: FontWeight.w500,
                              textColor: AppColors().introBlack,
                              textFamily: fontFamilyMedium,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 45.px,
                          width: 45.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors().white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors().introBlack.withOpacity(0.3),
                                offset: const Offset(
                                  0.0,
                                  0.0,
                                ),
                                blurRadius: 15.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (GetStorageData().containKey(GetStorageData().loginData)) {
                                Get.toNamed(NotificationScreen.routes);
                              } else {
                                loginUserDialog();
                              }
                            },
                            child: Image.asset(
                              ImagePath.icNotification,
                              height: 25.px,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.px),
                        Container(
                          height: 45.px,
                          width: 45.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors().white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors().introBlack.withOpacity(0.3),
                                offset: const Offset(
                                  0.0,
                                  0.0,
                                ),
                                blurRadius: 15.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (GetStorageData().containKey(GetStorageData().loginData)) {
                                Get.toNamed(SettingScreen.routes);
                              } else {
                                loginUserDialog();
                              }
                            },
                            child: Image.asset(
                              ImagePath.icSettings,
                              height: 25.px,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.px),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: controller.filterBool.value
                              ? SizedBox(
                                  height: 45.px,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.categoryList.isNotEmpty ? controller.categoryList.length : 0,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      Categories item = controller.categoryList[index].categories!;
                                      return GestureDetector(
                                        onTap: () {
                                          controller.categorySelect.value = index;
                                          controller.getHome();
                                          controller.update();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          margin: EdgeInsets.symmetric(horizontal: 10.px),
                                          padding: EdgeInsets.all(15.px),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: index == controller.categorySelect.value
                                                ? AppColors().white
                                                : AppColors().introBlack.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(10.px),
                                          ),
                                          child: MyTextView(
                                            item.categoryName.toString().capitalize ?? "",
                                            textStyleNew: MyTextStyle(
                                              textSize: 15.px,
                                              textWeight: FontWeight.w500,
                                              textFamily: fontFamilyMedium,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        Expanded(
                          flex: 0,
                          child: GestureDetector(
                            onTap: () {
                              controller.filterBool.value = !controller.filterBool.value;
                              if (!controller.filterBool.value) {
                                controller.categorySelect.value = -1;
                              }
                              controller.hotelDetail.value = false;
                              controller.getHome();
                              controller.update();
                            },
                            child: Container(
                              height: 45.px,
                              width: 45.px,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors().white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors().introBlack.withOpacity(0.3),
                                    offset: const Offset(
                                      0.0,
                                      0.0,
                                    ),
                                    blurRadius: 15.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Image.asset(
                                ImagePath.icFillter,
                                height: 25.px,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 12.px),
                    SizedBox(height: controller.filterBool.value ? 10.px : 0),
                  ],
                ),
              ),
              //=-=-=-=-=- bottom three button -------------->>>>>
              Positioned(
                left: 0.px,
                bottom: 20.px,
                right: 0.px,
                child: controller.hotelDetail.value
                    ? CommonStoryTagContainer(
                        hotelIcon: controller.homeModel.isNotEmpty
                            ? controller.homeModel[controller.selectIndex.value].profile
                            : "",
                        buttonName: controller.homeModel.isNotEmpty
                            ? controller.homeModel[controller.selectIndex.value].isFollow == "0"
                                ? Languages.of(context)!.follow
                                : Languages.of(context)!.following
                            : Languages.of(context)!.follow,
                        offer: controller.homeModel[controller.selectIndex.value].isOffer == "true" ? true : false,
                        offerPer: controller.homeModel[controller.selectIndex.value].offerPer ?? "0",
                        hotelName: controller.homeModel.isNotEmpty
                            ? "${controller.homeModel[controller.selectIndex.value].fname.toString().capitalize} ${controller.homeModel[controller.selectIndex.value].lname.toString().capitalize}"
                            : Languages.of(context)!.vegan,
                        hotelTag:
                            "${controller.homeModel[controller.selectIndex.value].userType == Constants.owner ? "@" : "#"}${controller.homeModel[controller.selectIndex.value].tagId}",
                        isVerified: controller.homeModel.isNotEmpty &&
                                controller.homeModel[controller.selectIndex.value].isVerified == "true"
                            ? true
                            : false,
                        followTap: () {
                          if (GetStorageData().containKey(GetStorageData().loginData)) {
                            controller.followUnfollowUser(controller.homeModel[controller.selectIndex.value].id,
                                action: controller.homeModel[controller.selectIndex.value].isFollow == "0"
                                    ? "follow"
                                    : "unfollow");
                          } else {
                            loginUserDialog();
                          }
                        },
                        onTap: () {
                          Get.toNamed(HotelDetailScreen.routes,
                                  arguments: ["noTag", controller.homeModel[controller.selectIndex.value].id])!
                              .then((value) {
                            print("Value====> $value");
                            if (changing) {
                              controller.getHome();
                              controller.hotelDetail.value = false;
                              controller.update();
                              changing = false;
                            }
                            /*if (value == true) {
                              controller.getHome();
                              controller.hotelDetail.value = false;
                              controller.update();
                            }*/
                          });
                        },
                      )
                    : Constants.userOrOwner
                        ? SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //=-=-=-=-=- first  button -------------->>>>>
                              GestureDetector(
                                onTap: () {
                                  isMinus = false;
                                  Get.toNamed(MapScreen.routes, arguments: Languages.of(context)!.discount);
                                  MapController().onInit();
                                  controller.update();
                                },
                                child: Container(
                                  height: 83.px,
                                  width: 78.px,
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors().transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors().introBlack.withOpacity(0.3),
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 15.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                      const BoxShadow(
                                        color: Colors.transparent,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        ImagePath.icDiscount,
                                        // fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        bottom: -3,
                                        child: Container(
                                          height: 20.px,
                                          width: 78.px,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors().white,
                                            borderRadius: BorderRadius.circular(
                                              40.px,
                                            ),
                                          ),
                                          child: MyTextView(
                                            Languages.of(context)!.discount,
                                            textStyleNew: MyTextStyle(
                                              textSize: 14.px,
                                              textColor: AppColors().lightText,
                                              textWeight: FontWeight.w500,
                                              textFamily: fontFamilyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.px),
                              //=-=-=-=-=- second  button -------------->>>>>
                              GestureDetector(
                                onTap: () {
                                  if (GetStorageData().containKey(GetStorageData().loginData)) {
                                    isMinus = false;
                                    Get.toNamed(MapScreen.routes, arguments: Languages.of(context)!.friends);
                                    MapController().onInit();
                                    controller.update();
                                  } else {
                                    loginUserDialog();
                                  }
                                },
                                child: Container(
                                  height: 84.px,
                                  width: 78.px,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors().transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors().introBlack.withOpacity(0.3),
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 15.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                      const BoxShadow(
                                        color: Colors.transparent,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        ImagePath.icFriend,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 20.px,
                                          width: 78.px,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors().white,
                                            borderRadius: BorderRadius.circular(
                                              40.px,
                                            ),
                                          ),
                                          child: MyTextView(
                                            Languages.of(context)!.friends,
                                            textStyleNew: MyTextStyle(
                                              textSize: 14.px,
                                              textColor: AppColors().lightText,
                                              textWeight: FontWeight.w500,
                                              textFamily: fontFamilyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.px),

                              ///=-=-=-=-=- Trending -------------->>>>>
                              GestureDetector(
                                onTap: () {
                                  isMinus = false;
                                  Get.toNamed(MapScreen.routes, arguments: Languages.of(context)!.trending);
                                  MapController().onInit();
                                  controller.update();
                                },
                                child: Container(
                                  height: 84.px,
                                  width: 78.px,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors().transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors().introBlack.withOpacity(0.3),
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 15.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                      const BoxShadow(
                                        color: Colors.transparent,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        ImagePath.icTrending,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 20.px,
                                          width: 78.px,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors().white,
                                            borderRadius: BorderRadius.circular(
                                              40.px,
                                            ),
                                          ),
                                          child: MyTextView(
                                            Languages.of(context)!.trending,
                                            textStyleNew: MyTextStyle(
                                              textSize: 14.px,
                                              textColor: AppColors().lightText,
                                              textWeight: FontWeight.w500,
                                              textFamily: fontFamilyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        controller.filterBool.value
                            ? Expanded(
                                child: SizedBox(
                                  height: 45.px,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.filter.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // controller.hotelDetail.value = true;
                                          controller.filterIndex.value = index;
                                          controller.markerClass();
                                          controller.update();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          margin: EdgeInsets.symmetric(horizontal: 10.px),
                                          padding: EdgeInsets.all(15.px),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: index == controller.filterIndex.value ? AppColors().white : AppColors().introBlack.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(10.px),
                                          ),
                                          child: MyTextView(
                                            controller.filter[index],
                                            textStyleNew: MyTextStyle(
                                              textSize: 15.px,
                                              textWeight: FontWeight.w500,
                                              textFamily: fontFamilyMedium,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(width: 10.px),
                        GestureDetector(
                          onTap: () {
                            controller.filterBool.value = !controller.filterBool.value;
                            if (!controller.filterBool.value) {
                              controller.filterIndex.value = -1;
                            }
                            if (!controller.filterBool.value) {
                              controller.hotelDetail.value = false;
                            }
                            controller.markerClass();
                            controller.update();
                          },
                          child: Container(
                            height: 45.px,
                            width: 45.px,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors().white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors().introBlack.withOpacity(0.3),
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 15.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Image.asset(
                              ImagePath.icFillter,
                              height: 25.px,
                            ),
                          ),
                        ),
                      ],
                    ),*/
