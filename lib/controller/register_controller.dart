import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

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

  @override
  clearController() {
    name.clear();
    email.clear();
    password.clear();
    phoneNumber.clear();
    confirmPassword.clear();
  }

  @override
  register() {
    if (formState.currentState!.validate()) {}
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
