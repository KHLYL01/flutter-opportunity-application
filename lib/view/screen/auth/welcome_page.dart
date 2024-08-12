import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/outline_button.dart';

import '../../../core/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome To Shaghilni! ^_^',
                  style: TextStyle(
                      fontSize: 25, color: Colors.black, decorationStyle: null),
                ),
              ],
            ).paddingOnly(top: 20, bottom: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: AppColors.myDarkBlue,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 3,
                      animatedTexts: [
                        TypewriterAnimatedText('Get your Dream Job...',
                            speed: const Duration(milliseconds: 100),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              AppImages.welcome,
              width: 300,
              height: 300,
            ).paddingOnly(bottom: 50),
            CustomFillButton(
              width: context.width * 0.3,
              text: 'Login',
              icon: Icons.email_outlined,
              onPressed: () => Get.toNamed(AppRoutes.loginPage),
            ).paddingOnly(bottom: 20),
            CustomOutlineButton(
              width: context.width * 0.315,
              text: 'Sign up',
              icon: Icons.add,
              onPressed: () => Get.toNamed(AppRoutes.registerPage),
            ),
          ],
        ),
      ).paddingSymmetric(vertical: 20.0, horizontal: 10.0),
    ).makeSafeArea();
  }
}
