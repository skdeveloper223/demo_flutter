import 'dart:convert';
import 'dart:io';

import 'package:adres/commons/all.dart';
import 'package:adres/commons/common_widgets/base_widgets.dart';
import 'package:app_settings/app_settings.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' hide PermissionStatus, LocationAccuracy;
import 'package:permission_handler/permission_handler.dart';

import '../../../commons/common_widgets/rxcommon_model.dart';
import '../../../models/commandata_response_model.dart';
import '../../../models/home_response_model.dart';
import '../../../models/login_response_model.dart';

class HomeController extends BaseController {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  Set<Marker> markers = {};
  // final List<Marker> markers = <Marker>[];

  GoogleMapController? mapController;
  List<HomeData> homeModel = [];

  RxString imgUrl = "".obs;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    update();
  }

  GlobalKey globalKey = GlobalKey();

  markerClass({var lat, lng}) async {
    markers.clear();
    printAction("markers.clear()====> ");
    markers.add(Marker(
      markerId: MarkerId("me"),
      icon: imgUrl.value != ""
          ? await utils.convertNetworkImageToCustomBitmapDescriptor(imgUrl.value,
              title: "Me", addBorder: true, borderColor: appColors.appColor, titleBackgroundColor: appColors.appColor)
          : BitmapDescriptor.fromBytes(await utils.getBytesFromAsset(ImagePath.userIcon, Platform.isAndroid ? 150 : 160)),
      position: LatLng(userLocationLat ?? lat, userLocationLng ?? lng),
      onTap: () {
        update();
      },
    ));

    update();

    for (int i = 0; i < homeModel.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(homeModel[i].id!),
        icon: homeModel != null
            ? await utils.convertNetworkImageToCustomBitmapDescriptor1(homeModel[i].profile!,
                title: "${homeModel[i].fname!} ${homeModel[i].lname!}",
                addBorder: true,
                borderColor: appColors.red,
                titleBackgroundColor: appColors.appColor)
            : BitmapDescriptor.fromBytes(await utils.getBytesFromAsset(ImagePath.userIcon, Platform.isAndroid ? 150 : 160)),
        position: LatLng(double.parse(homeModel[i].lat!), double.parse(homeModel[i].lng!)),
        onTap: () {
          hotelDetail.value = true;
          selectIndex.value = i;
          update();
        },
      ));

      update();
    }
    // if (mapController != null) {
    //   mapController!.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(userLocationLat!, userLocationLng!), zoom: 17),
    //   ));
    // }
    update();
  }

  RxBool filterBool = false.obs;
  RxBool hotelDetail = false.obs;
  RxInt selectIndex = 0.obs;
  double? userLocationLat;
  double? userLocationLng;
  List<RxCommonModel> categoryList = <RxCommonModel>[].obs;
  RxInt categorySelect = 0.obs;
  RxString locationCity = "Loading..".obs;

  @override
  void onInit() async {
    categorySelect.value = -1;

    getUserData();
    checkPermission();

    super.onInit();
  }

  Future<String> getAddressFromLatLng({var lat, lng}) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${Constants.googleApiKey}';
    final response = await http.get(Uri.parse(url));
    print(response);
    print("responseresponseresponseresponseresponseresponse");
    if (response.statusCode == 200) {
      final jsonResult = json.decode(response.body);
      final results = jsonResult['results'] as List<dynamic>;
      print(results);
      if (results.isNotEmpty) {
        // final address = results[0]['formatted_address'];
        printAction("Address==> ${results[0]}");
        final address = results[0]['formatted_address'];
        locationCity.value = address;
        printAction("Address==> ${locationCity.value}");
        update();
        return address;
      }
    }
    return "";
  }

  getUserData() async {
    if (getStorageData.containKey(getStorageData.loginData)) {
      LoginModel model = LoginModel.fromJson(getStorageData.readObject(getStorageData.loginData));
      if (model.responseCode == 1) {
        imgUrl.value = model.data!.profile!;
        update();
      } else {
        utils.showSnackBar(context: Get.context!, message: model.responseMsg!);
      }
    }
  }

  /// ---- Get Home APi ----------->>>
  getHome({var lat, lng}) async {
    FormData formData = FormData.fromMap({
      'user_id': getStorageData.readObject(getStorageData.userId),
      'curLat': lat ?? userLocationLat!,
      'curLng': lng ?? userLocationLng!,
    });
    if (filterBool.value && categorySelect.value != -1) {
      formData.fields.add(MapEntry("cat_ids", categoryList[categorySelect.value].categories!.id!));
    }
    final data = await APIFunction().apiCall(
      context: Get.context!,
      apiName: Constants.getHome,
      params: formData,
      token: getStorageData.readObject(getStorageData.token),
    );

    HomeModel model = HomeModel.fromJson(data);
    if (model.responseCode == 1) {
      if (model.data!.isNotEmpty) {
        homeModel = model.data!;

        update();
      } else {}
      markerClass(lat: lat, lng: lng);

      // utils.showSnackBar(context: Get.context!, message: model.responseMsg!,isOk: true);

      update();
    } else if (model.responseCode == 0) {
      utils.showSnackBar(context: Get.context!, message: model.responseMsg!);
    }
  }

  /// ---- Follow & UnFollow User APi ----------->>>
  followUnfollowUser(id, {action = "unfollow"}) async {
    FormData formData = FormData.fromMap({
      'user_id': getStorageData.readObject(getStorageData.userId),
      'follow_user_id': id,
      'follow_action': action,
    });
    final data = await APIFunction().apiCall(
      context: Get.context!,
      apiName: Constants.followUser,
      params: formData,
      token: getStorageData.readObject(getStorageData.token),
    );

    LoginModel model = LoginModel.fromJson(data);
    if (model.responseCode == 1) {
      utils.showSnackBar(context: Get.context!, message: model.responseMsg!, isOk: true);
      homeModel[selectIndex.value].isFollow = ((action == "follow") ? "1" : "0");
      // hotelDetail.value = false;

      // getHome();
      update();
    } else if (model.responseCode == 0) {
      utils.showSnackBar(context: Get.context!, message: model.responseMsg!);
    }
  }

  /// ---- Get CommanData APi ----------->>>
  getCommanDataAPI() async {
    FormData formData = FormData.fromMap({
      'user_id': getStorageData.readObject(getStorageData.userId),
    });
    final data = await APIFunction().apiCall(
      context: Get.context!,
      apiName: Constants.getCommanData,
      params: formData,
      isLoading: false,
      token: getStorageData.readObject(getStorageData.token),
    );

    CommanDataModel model = CommanDataModel.fromJson(data);
    if (model.responseCode == 1) {
      categoryList.clear();
      for (int i = 0; i < model.data!.categories!.length; i++) {
        Categories modelData = model.data!.categories![i];
        categoryList.add(RxCommonModel(categories: modelData, check: false));
      }
      update();
    } else if (model.responseCode == 0) {
      utils.showSnackBar(context: Get.context!, message: model.responseMsg!);
    }
  }

  isLocationPermission({required bool isDoRequest}) async {
    var status = await Permission.location.status;

    bool isEnableService = await locationPermission();
    printAction("isEnableService: $isEnableService");

    if (isEnableService) {
      if (status.isGranted) {
        processNext();
      }
    }
  }

  Future<bool> locationPermission({bool isDoRequest = false}) async {
    Location location = Location();
    bool isEnableService1 = await location.serviceEnabled();
    if (isDoRequest && !isEnableService1) {
      printAction('test_current_location: isEnableService1 $isEnableService1');

      isEnableService1 = await location.requestService();
    }
    return isEnableService1;
  }

  Future<void> processNext() async {
    Position latng = await utils.determinePosition();
    getCurrentLocation();
    await getAddressFromLatLng(lat: latng.latitude, lng: latng.longitude);
    print("getHomegetHomegetHomegetHomegetHomegetHomegetHome$latng");
    print("getHomegetHomegetHomegetHomegetHomegetHomegetHome");
    getHome(lng: latng.longitude, lat: latng.latitude);
    getCommanDataAPI();
    userLocationLat = latng.latitude;
    userLocationLng = latng.longitude;
    update();
    // printAction("test_permissionStatus: $permissionStatus");
  }

  getCurrentLocation() async {
    try {
      var status = await Permission.location.status;

      if (status.isGranted) {
        await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        ).then((Position position) async {
          printError("position----lat->>${position.latitude}");
          printError("position----lng--->>${position.longitude}");

          await getAddressFromLatLng(lat: position.latitude, lng: position.longitude);
          print("getHomegetHomegetHomegetHomegetHomegetHomegetHome");
          getHome(lng: position.longitude, lat: position.latitude);
          getCommanDataAPI();
          userLocationLat = position.latitude;
          userLocationLng = position.longitude;
          update();
        }).catchError((e) {
          debugPrint(e.toString());
        });
      }
    } catch (e) {
      print("Error=====>$e");
    }
  }

  Future<void> checkPermission() async {
    try {
      // You can request multiple permissions at once.

      var status = await Permission.location.status;
      printAction("status: $status");

      bool isEnableService = await locationPermission(isDoRequest: true);
      printAction("isEnableService: $isEnableService");

      if (!status.isGranted && !isEnableService) {
        // You can request multiple permissions at once.

        status = await Permission.location.request();
        printAction("status: $status");
        if (status.isPermanentlyDenied) {
          openAppSettings();
        }

        isEnableService = await isLocationPermission(isDoRequest: true);
        printAction("isEnableService: $isEnableService");

        if (!isEnableService) {
          AppSettings.openLocationSettings();
        }

        if (status.isGranted && isEnableService) {
          print('Got permission and service enabled');
          processNext();
        }
      } else {
        processNext();
      }
    } catch (e) {
      print("Error=====>$e");
    }
  }

  @override
  void dispose() {
    mapController?.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
