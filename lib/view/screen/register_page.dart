import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/auth/register_controller.dart';
import 'package:opportunity_app/core/enums/input_status.dart';
import 'package:opportunity_app/core/functions/validate_input.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/enums/status_request.dart';
import '../../core/extensions/widget_extension.dart';
import '../widget/custom_loading.dart';
import '../widget/drop_down.dart';
import '../widget/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterControllerImp controller = Get.find();

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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.myDarkBlue,
                  ),
                ).center().paddingOnly(top: 50, bottom: 30),
                CustomTextField(
                  title: 'Name',
                  hint: 'enter your name',
                  textEditingController: controller.name,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.none,
                  ),
                ),
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
                const CustomDropDown(
                  title: 'Role',
                  currentSelected: 'USER',
                  list: [
                    'USER',
                    'ADMIN',
                  ],
                ),
                CustomTextField(
                  title: 'Phone Number',
                  hint: '+963...',
                  textEditingController: controller.phoneNumber,
                  isPhone: true,
                  textInputType: TextInputType.phone,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.phone,
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
                ),
                CustomTextField(
                  title: 'Confirm Password',
                  hint: 'Enter your confirm password',
                  textEditingController: controller.confirmPassword,
                  textInputType: TextInputType.visiblePassword,
                  isSecret: true,
                  validator: (String? value) => validateInput(
                    input: value!,
                    inputStatus: InputStatus.password,
                  ),
                ).paddingOnly(bottom: 40),
                CustomFillButton(
                  width: context.width,
                  text: 'Sign Up',
                  textFont: 24,
                  onPressed: () => controller.register(),
                ),
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
                          text: 'Already have an account? ',
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: AppColors.myDarkBlue,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                      .onTap(
                        () => controller.goToLogin(),
                      )
                      .center(),
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
