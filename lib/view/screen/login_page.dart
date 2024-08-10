import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/auth/login_controller.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/enums/input_status.dart';
import '../../core/enums/status_request.dart';
import '../../core/functions/validate_input.dart';
import '../widget/custom_loading.dart';
import '../widget/fill_button.dart';
import '../widget/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            AppImages.authShape,
            height: context.height / 6,
            color: AppColors.myDarkBlue,
          ).align(alignment: const Alignment(-1, -1)),
          Transform.rotate(
            angle: -pi,
            child: Image.asset(
              AppImages.authShape,
              height: context.height / 12,
              color: AppColors.myDarkBlue,
            ).align(alignment: const Alignment(-1, -1)),
          ),
          Form(
            key: controller.formState,
            child: ListView(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.myDarkBlue,
                  ),
                ).center().paddingOnly(top: 170, bottom: 30),
                CustomTextField(
                  title: 'Email',
                  hint: 'Someone@email.com',
                  textEditingController: controller.email,
                  textInputType: TextInputType.emailAddress,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.email,
                  ),
                ),
                CustomTextField(
                  title: 'Password',
                  hint: 'Enter your password',
                  textEditingController: controller.password,
                  textInputType: TextInputType.visiblePassword,
                  isSecret: true,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.password,
                  ),
                ).paddingOnly(bottom: 40),
                CustomFillButton(
                  width: context.width,
                  text: 'Login',
                  textFont: 24,
                  onPressed: () => controller.login(),
                ).paddingSymmetric(horizontal: 30),
                SizedBox(
                  width: context.width,
                  height: 60,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: AppColors.myDarkBlue,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() => controller.goToRegister()).center(),
                )
              ],
            ).paddingSymmetric(horizontal: 16),
          ),
          Obx(
            () => controller.statusRequest.value == StatusRequest.loading
                ? const CustomLoading()
                : Container(),
          ),
        ],
      ),
    ).makeSafeArea();
  }
}
