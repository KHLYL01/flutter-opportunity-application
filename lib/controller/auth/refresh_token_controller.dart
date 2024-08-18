import 'dart:developer';

import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';

import '../../core/constants/app_routes.dart';
import '../../core/enums/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/data_sources/remote/auth_data.dart';

abstract class RefreshTokenController extends GetxController {
  refreshToken();
}

class RefreshTokenControllerImp extends RefreshTokenController {
  AuthData authData = AuthData(Get.find());
  MyServices myServices = Get.find();
  Rx<StatusRequest> statusRequest = Rx(StatusRequest.none);

  @override
  refreshToken() async {
    statusRequest.value = StatusRequest.loading;
    var response = await authData.refreshData(
      refreshToken: myServices.getRefreshToken(),
    );
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      myServices.saveString(AppKeys.token, response['token']);
      myServices.saveString(AppKeys.refresh, response['refreshToken']);
      log(myServices.getToken());
      // if (myServices.getString('role')! == "ADMIN") {
      //   Get.offAllNamed(AppRoute.adminCoursePage);
      // } else {
      //   Get.offAllNamed(AppRoute.coursesPage);
      // }
      Get.offNamed(AppRoutes.homePage);
    } else if (statusRequest.value != StatusRequest.offlineFailure &&
        statusRequest.value != StatusRequest.serverException) {
      myServices.sharedPreferences.remove('step');
      Get.offNamed(AppRoutes.loginPage);
      statusRequest.value = StatusRequest.tokenFailure;
      log(response.toString());
    }
  }

  @override
  void onInit() async {
    await refreshToken();
    super.onInit();
  }
}
