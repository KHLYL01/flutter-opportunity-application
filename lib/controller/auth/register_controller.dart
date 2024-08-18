import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/custom_snack_bar.dart';
import 'package:opportunity_app/core/services/services.dart';
import '../../data/data_sources/remote/auth_data.dart';

import '../../core/functions/handling_data.dart';

abstract class RegisterController extends GetxController {
  register();
  goToLogin();
  clearController();
}

class RegisterControllerImp extends RegisterController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController phoneNumber;

  late GlobalKey<FormState> formState;

  MyServices myServices = Get.find();
  AuthData authData = AuthData(Get.find());
  Rx<StatusRequest> statusRequest = Rx(StatusRequest.none);

  @override
  register() async {
    if (formState.currentState!.validate()) {
      statusRequest.value = StatusRequest.loading;
      update();
      var response = await authData.registerData(
        name: name.text,
        email: email.text,
        password: password.text,
        phoneNumber: phoneNumber.text,
        role: Get.find<DropDownController>(tag: 'Role').currentSelected.value,
      );

      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        customSnackBar(
          title: 'Done',
          message: 'account register successfully',
        );
        goToLogin();
        clearController();
      } else {
        statusRequest.value = StatusRequest.failure;
        log(response.toString());
        customSnackBar(
          title: 'Warning',
          message: 'This Email is used',
          isDone: false,
        );
      }
    }
  }

  @override
  clearController() {
    name.clear();
    email.clear();
    password.clear();
    phoneNumber.clear();
    confirmPassword.clear();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.loginPage);
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phoneNumber.dispose();
    super.dispose();
  }
}
