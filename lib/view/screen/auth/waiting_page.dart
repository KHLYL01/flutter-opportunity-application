import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: const Text(
              'Wait for your account to be verified by the admin before attempting to log in.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ).paddingSymmetric(horizontal: 48).center(),
          ).expanded(flex: 1),
          CustomFillButton(
            width: double.infinity,
            text: 'Go To Login',
            onPressed: () {
              Get.offNamed(AppRoutes.loginPage);
            },
          ).paddingSymmetric(horizontal: 16, vertical: 20),
        ],
      ),
    ).makeSafeArea();
  }
}
