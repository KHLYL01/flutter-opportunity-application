import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/home_controller.dart';
import 'package:opportunity_app/controller/job_controller.dart';
import 'package:opportunity_app/controller/user_profile_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/screen/search_delegate.dart';
import 'package:opportunity_app/view/widget/company_card.dart';
import 'package:opportunity_app/view/widget/job_card.dart';

import '../../controller/free_job_controller.dart';
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
      drawerEdgeDragWidth: context.width / 3,
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
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.getAllUserProfiles(),
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const Text(
                'Opportunities',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ).paddingOnly(bottom: 10),
              SizedBox(
                height: context.height / 5.5,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.jobs.length,
                  itemBuilder: (context, index) {
                    var item = controller.jobs[index];
                    return JobCard(
                      name: item.title,
                      description: item.description,
                      location: item.location,
                      expiryDate: item.expiryDate.substring(0, 10),
                      jobType: item.jopType,
                      online: item.online,
                    ).onTap(
                      () => Get.toNamed(
                        AppRoutes.jobDetailsPage,
                        arguments: [item],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
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
                  itemCount: controller.companyProfiles.length,
                  itemBuilder: (context, index) {
                    var item = controller.companyProfiles[index];
                    return CompanyCard(
                      name: item.name,
                      scope: item.scope ?? '',
                      imageUrl: item.imageUrl ?? '',
                      review: item.reviewCount,
                      totalRate: item.totalRate,
                    ).onTap(
                      () {
                        Get.toNamed(AppRoutes.viewCompanyProfilePage);
                        Get.find<CompanyProfileControllerImp>()
                            .getCompanyProfile(id: item.id);
                        Get.find<JobControllerImp>()
                            .getAllDataByCompanyUserId(id: item.id);
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
              ).paddingOnly(bottom: 10),
              const Text(
                'People',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ).paddingOnly(bottom: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.userProfiles.length,
                itemBuilder: (context, index) {
                  var item = controller.userProfiles[index];
                  return PeopleCard(
                    name: item.name,
                    description: item.specialty ?? '',
                    imageUrl: item.imageUrl ?? '',
                  ).onTap(
                    () {
                      Get.toNamed(AppRoutes.viewUserProfilePage);
                      Get.find<UserProfileControllerImp>()
                          .getUserProfile(id: item.id);
                      Get.find<FreeJobControllerImp>()
                          .getAllDataByUserProfileId(id: item.id);
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              )
            ],
          ).paddingSymmetric(horizontal: 15.0, vertical: 10.0),
        ),
      ),
    );
  }
}
