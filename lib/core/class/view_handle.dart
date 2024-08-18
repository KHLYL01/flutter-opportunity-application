import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../view/widget/custom_loading.dart';

import '../constants/app_routes.dart';
import '../enums/status_request.dart';

class ViewHandle extends StatelessWidget {
  const ViewHandle({
    Key? key,
    required this.widget,
    required this.statusRequest,
    this.onPressed,
  }) : super(key: key);

  final Widget widget;
  final StatusRequest statusRequest;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return const CustomLoading();
      case StatusRequest.serverException ||
            StatusRequest.offlineFailure ||
            StatusRequest.failure:
        return TextButton(
          onPressed: onPressed,
          child: const Row(
            children: [
              Text(
                "Reconnect",
                // style: TextStyle(color: AppColor.style1secondary1),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.wifi_off_rounded,
                size: 32,
                // color: AppColor.style1main2,
              ),
            ],
          ),
        ).fittedBox().center();
      case StatusRequest.tokenFailure:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "press to login again".tr,
                textAlign: TextAlign.center,
              ),
            ).onTap(
              () => Get.offNamed(AppRoutes.loginPage),
            ),
          ],
        ).center();
      default:
        return widget;
    }
  }
}
