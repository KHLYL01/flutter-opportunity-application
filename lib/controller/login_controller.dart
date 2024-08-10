import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

abstract class LoginController extends GetxController {
  login();
  goToRegister();
  clearController();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  late GlobalKey<FormState> formState;

  @override
  clearController() {
    email.clear();
    password.clear();
  }

  @override
  login() {
    if (formState.currentState!.validate()) {}
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
}
