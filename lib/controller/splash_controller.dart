import 'dart:async';

import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 1),
      () => Get.offNamed(AppRoutes.welcomePage),
    );
    super.onInit();
  }
}
