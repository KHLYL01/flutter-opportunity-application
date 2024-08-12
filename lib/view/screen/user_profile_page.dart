import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../core/constants/app_routes.dart';
import '../widget/attached_file_card.dart';
import '../widget/job_card.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            children: [
              _buildFirstSectionOfProfile(),
              const AttachedFileCard(
                title: 'My Resume',
              ),
              Container(
                  margin: const EdgeInsets.only(top: 8, left: 10.0),
                  child: const Row(
                    children: [
                      Text(
                        'Published Opportunities',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ],
                  )),
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ).paddingSymmetric(horizontal: 10, vertical: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstSectionOfProfile() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                AssetImage('assets/images/logo${Random().nextInt(3) + 1}.png'),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'my name',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'my specialization',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
