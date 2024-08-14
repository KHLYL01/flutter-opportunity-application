import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/outline_button.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_routes.dart';
import '../widget/job_card.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.userUpdateProfilePage),
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
          ).paddingOnly(right: 5)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addFreeJobPage),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.blue,
              child: Text(
                'M',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            title: Text(
              'my name',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'my specialization',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          CustomOutlineButton(
            width: context.width,
            text: 'Resume',
            icon: Icons.attach_file_outlined,
            padding: 0,
            onPressed: () {
              Get.toNamed(AppRoutes.pdfFilePage);
            },
          ).paddingSymmetric(horizontal: 10, vertical: 10),
          const Text(
            'Main Information',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ).paddingSymmetric(horizontal: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.verLightBlue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Age: 25',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ).paddingSymmetric(horizontal: 10, vertical: 8),
                const Text(
                  'Gender: Male',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ).paddingSymmetric(horizontal: 10, vertical: 4),
                const Text(
                  'Nationality: Syrian',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ).paddingSymmetric(horizontal: 10, vertical: 8),
                const Text(
                  'City: Daraa',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ).paddingSymmetric(horizontal: 10, vertical: 8),
                const Text(
                  'Educational Level: Bachelor',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ).paddingSymmetric(horizontal: 10, vertical: 8),
              ],
            ),
          ).paddingSymmetric(horizontal: 10, vertical: 10),
          const Text(
            'Published Opportunities',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ).paddingSymmetric(horizontal: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const JobCard(
                name:
                    'Full Stack Developer Full Stack Developer Full Stack Developer',
                description: 'loram azsd asdiw fsdfds asdfa',
                location: 'Damascus',
                expiryDate: '10/10/2025',
                jobType: 'full time',
                isOnline: true,
              ).onTap(
                () => Get.toNamed(AppRoutes.jobDetailsPage),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ],
      ),
    );
  }
}
