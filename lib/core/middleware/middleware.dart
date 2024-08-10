import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';
import '../services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == 'refresh') {
      return const RouteSettings(name: AppRoutes.refreshPage);
    }
    return null;
  }
}
