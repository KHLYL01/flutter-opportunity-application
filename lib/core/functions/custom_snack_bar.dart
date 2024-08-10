import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

customSnackBar({
  required String title,
  required String message,
  required bool isDone,
}) {
  return Get.showSnackbar(
    GetSnackBar(
      duration: const Duration(milliseconds: 1500),
      title: title,
      message: message,
      icon: isDone
          ? const Icon(
              Icons.done_all,
              color: AppColors.myDarkBlue,
            )
          : const Icon(
              Icons.warning_amber,
              color: Colors.red,
            ),
    ),
  );
}
