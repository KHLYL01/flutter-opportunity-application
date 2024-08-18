import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertDialog(
    {String title = 'Warning',
    String middleText = 'Do you already want to exit the application',
    VoidCallback? onPressedConfirm,
    VoidCallback? onPressedCancel,
    Widget? content,
    bool withoutButton = false}) {
  return Get.defaultDialog(
    title: title.tr,
    middleText: middleText.tr,
    content: content,
    titleStyle: Theme.of(Get.context!).textTheme.headlineMedium!.copyWith(
          fontSize: 24,
          // color: themeController.isDarkTheme.value ? Colors.white : null,
        ),
    middleTextStyle: Theme.of(Get.context!).textTheme.headlineMedium!.copyWith(
          fontSize: 16,
          // color: themeController.isDarkTheme.value ? Colors.white : null,
        ),
    backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
    actions: withoutButton
        ? []
        : [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: onPressedCancel ??
                  () {
                    Get.back();
                  },
              child: const Text(
                'إلغاء',
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: onPressedConfirm ??
                  () {
                    exit(0);
                  },
              child: const Text(
                'تأكيد',
              ),
            ),
          ],
  );
}
