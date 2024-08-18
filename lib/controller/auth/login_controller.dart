import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

import '../../core/enums/status_request.dart';
import '../../core/functions/custom_snack_bar.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/data_sources/remote/auth_data.dart';

abstract class LoginController extends GetxController {
  login();
  goToRegister();
  goToRefresh();
  clearController();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  late GlobalKey<FormState> formState;

  MyServices myServices = Get.find();
  AuthData authData = AuthData(Get.find());
  Rx<StatusRequest> statusRequest = Rx(StatusRequest.none);

  @override
  clearController() {
    email.clear();
    password.clear();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();
      var response = await authData.loginData(
        email: email.text,
        password: password.text,
      );

      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        customSnackBar(
          title: 'Done',
          message: 'login successfully',
        );

        myServices.saveString(AppKeys.token, response['token']);
        myServices.saveString(AppKeys.refresh, response['refreshToken']);
        myServices.saveString(AppKeys.name, response['name']);
        myServices.saveString(AppKeys.email, response['email']);
        myServices.saveString(AppKeys.phone, response['phoneNumber']);
        myServices.saveString(AppKeys.role, response['role']);
        myServices.saveInt(AppKeys.id, response['id']);
        myServices.saveInt(AppKeys.profileId, response['profileId']);
        myServices.saveString(AppKeys.step, 'refresh');

        goToRefresh();
        clearController();
      } else {
        statusRequest.value = StatusRequest.failure;
        log(response.toString());
        customSnackBar(
          title: 'Warning',
          message: 'This Email is not found',
          isDone: false,
        );
      }
    }
  }

  @override
  goToRegister() {
    Get.offNamed(AppRoutes.registerPage);
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToRefresh() {
    Get.offAllNamed(AppRoutes.refreshPage);
  }
}
