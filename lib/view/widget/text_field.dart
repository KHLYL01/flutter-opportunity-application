import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.hint,
    required this.textEditingController,
    required this.validator,
    this.isSecret = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController textEditingController;
  final bool isSecret;
  final FormFieldValidator<String> validator;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            obscureText: isSecret,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              border: InputBorder.none,
              fillColor: AppColors.filledColor,
              filled: true,
            ),
            keyboardType: textInputType,
            validator: validator,
          ),
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}
