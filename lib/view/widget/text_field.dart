import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/obscure_controller.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import '../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.hint,
    required this.textEditingController,
    required this.validator,
    this.isSecret = false,
    this.isPhone = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController textEditingController;
  final bool isSecret;
  final bool isPhone;
  final FormFieldValidator<String> validator;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    Get.put(ObscureController());

    return GetBuilder<ObscureController>(
      builder: (controller) => SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ).paddingOnly(bottom: 10),
            TextFormField(
              obscureText: isSecret ? controller.obscure : false,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                border: InputBorder.none,
                fillColor: AppColors.filledColor,
                filled: true,
                prefixIcon: isPhone
                    ? const Icon(
                        Icons.phone,
                        color: AppColors.myDarkBlue,
                      )
                    : null,
                suffixIcon: isSecret
                    ? IconButton(
                        onPressed: () => controller.changeObscure(),
                        icon: Icon(
                          controller.obscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.myDarkBlue,
                        ),
                      ).paddingDirectional(
                        const EdgeInsetsDirectional.only(end: 10),
                      )
                    : null,
              ),
              keyboardType: textInputType,
              validator: validator,
            ),
          ],
        ),
      ).paddingOnly(bottom: 10),
    );
  }
}
