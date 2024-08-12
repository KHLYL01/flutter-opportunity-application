import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../../controller/auth/refresh_token_controller.dart';
import '../../../core/class/view_handle.dart';

class RefreshTokenPage extends StatelessWidget {
  const RefreshTokenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RefreshTokenControllerImp>(
        builder: (controller) => ViewHandle(
          statusRequest: controller.statusRequest.value,
          onPressed: () => controller.refreshToken(),
          widget: Container(),
        ),
      ),
    ).makeSafeArea();
  }
}
