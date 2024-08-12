import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  late GlobalKey<ScaffoldState> scaffoldState;

  @override
  void onInit() {
    scaffoldState = GlobalKey<ScaffoldState>();
    super.onInit();
  }
}
