import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../commons/get_storage_data.dart';
import '../commons/utils.dart';
import '../languages/language.dart';
import 'api_class.dart';

export 'package:get/get.dart' hide Response, FormData, MultipartFile, ScreenType;

class APIFunction {
  Future<dynamic> apiCall({
    required String apiName,
    required BuildContext context,
    FormData? params,
    String? token = "",
    bool isLoading = true,
  }) async {
    printAction("params -------->>> ${params!.fields}");
    var response = await HttpUtil(token ?? "", isLoading, context).post(
      apiName,
      data: params,
    );

    return response;
  }
}

class GetAPIFunction {
  Future<dynamic> apiCall({
    required String apiName,
    required BuildContext context,
    FormData? params,
    String? token = "",
    bool isLoading = true,
  }) async {
    var response = await HttpUtil(token!, isLoading, context).get(
      apiName,
    );
    if (GetStorageData().readString('is_guest') != null && GetStorageData().readString('is_guest') == "true") {
      print("GuestGuestGuestGuestGuestGuestGuestGuestGuestGuestGuest");
      if (response['ResponseCode'] == 0) {
        if (GetStorageData().containKey(GetStorageData().loginData)) {
          return response;
        } else {
          Utils().showSnackBar(context: context, message: Languages.of(context)!.guestError);
        }
      } else {
        return response;
      }
    } else {
      return response;
    }
  }
}
