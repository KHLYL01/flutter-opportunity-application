import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/home_controller.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/screen/search_delegate.dart';
import 'package:opportunity_app/view/widget/company_card.dart';
import 'package:opportunity_app/view/widget/job_card.dart';

import '../widget/custom_drawer_widget.dart';
import '../widget/people_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.find();

    return Scaffold(
      key: controller.scaffoldState,
      backgroundColor: Colors.white,
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: context.width - context.width / 6,
        leading: TextField(
          onTap: () =>
              showSearch(context: context, delegate: MySearchDelegate()),
          onChanged: (value) {},
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xFFe4e9ec),
            filled: true,
            hintText: 'Search',
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black87),
            suffixIcon: const Icon(
              Icons.search,
              size: 25,
              color: Colors.black87,
            ).paddingSymmetric(horizontal: 15.0),
            prefixIcon: IconButton(
              onPressed: () {
                controller.scaffoldState.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.dehaze,
                size: 25,
                color: Colors.black87,
              ),
            ),
          ),
        ).paddingOnly(left: 10, top: 10),
        actions: [
          const Icon(
            Icons.notifications,
            color: Colors.black,
            size: 32,
          ).onTap(() {
            Get.toNamed(AppRoutes.notificationsPage);
          }).paddingOnly(right: 20, top: 15, bottom: 10),
        ],
      ),
      body: ListView(
        children: [
          const Text(
            'Opportunities',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ).paddingOnly(bottom: 10),
          SizedBox(
            height: context.height / 5.5,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
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
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ).paddingOnly(bottom: 10),
          const Text(
            'Companies',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ).paddingOnly(bottom: 10),
          SizedBox(
            height: context.height / 8,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CompanyCard(
                  name: 'Google',
                  scope: "Software Company",
                  imageUrl: '',
                  review: 10,
                  totalRate: 4.5,
                ).onTap(() => Get.toNamed(AppRoutes.companyProfilePage));
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ).paddingOnly(bottom: 10),
          const Text(
            'People',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ).paddingOnly(bottom: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const PeopleCard(
                name: 'Google',
                description: "Software Company",
                imageUrl: '',
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          )
        ],
      ).paddingSymmetric(horizontal: 15.0, vertical: 10.0),
    );
  }
}
