import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: context.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: AppColors.verLightBlue,
            ),
            child: const ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(AppImages.splash),
              ),
              title: Text(
                'Meta has posted a new opportunity , check it out !',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Full Stack Web Developer',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ).paddingSymmetric(vertical: 10.0),
          ),
        ).onLongPress(() {
          // ToDo Delete
        }).paddingSymmetric(vertical: 5),
      ).paddingSymmetric(horizontal: 15.0, vertical: 10.0),
    ).makeSafeArea();
  }
}
