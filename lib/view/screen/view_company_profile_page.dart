import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/report_controller.dart';
import 'package:opportunity_app/core/constants/app_colors.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/screen/view_util/image_page.dart';

import '../../../link_api.dart';
import '../../controller/job_controller.dart';
import '../../core/class/view_handle.dart';
import '../../core/constants/app_routes.dart';
import '../../core/enums/status_request.dart';
import '../widget/fill_button.dart';
import '../widget/job_card.dart';

class ViewCompanyProfilePage extends StatelessWidget {
  const ViewCompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // CompanyProfileModel companyProfileModel = Get.arguments[0];
    return GetBuilder<CompanyProfileControllerImp>(
      builder: (controller) => ViewHandle(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          appBar: AppBar(
            title: Text('${controller.companyProfile.name} Profile'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ListTile(
                dense: true,
                title: Text(
                  controller.companyProfile.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  controller.companyProfile.scope == null
                      ? '...'
                      : controller.companyProfile.scope!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                leading: SizedBox(
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blue,
                    backgroundImage: controller.companyProfile.imageUrl != null
                        ? NetworkImage(
                            '${AppLink.images}/image/${controller.companyProfile.imageUrl!}',
                          )
                        : null,
                    child: controller.companyProfile.imageUrl == null
                        ? Text(
                            controller.companyProfile.name == ''
                                ? ' '
                                : controller.companyProfile.name[0],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        : null,
                  ).onTap(
                    controller.companyProfile.imageUrl != null
                        ? () {
                            Get.to(
                              () => ImagePage(
                                image: controller.companyProfile.imageUrl!,
                              ),
                            );
                          }
                        : () {},
                  ),
                ),
              ),
              if (controller.myServices.getString(AppKeys.role) == 'USER')
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomFillButton(
                      width: context.width * 0.2,
                      text: 'Report',
                      fillColor: AppColors.heavyRed,
                      onPressed: Get.find<ReportControllerImp>()
                              .checkIsFound(controller.companyProfile.id)
                          ? null
                          : () {
                              Get.toNamed(AppRoutes.addReportPage);
                            },
                    ),
                    const SizedBox(width: 30),
                    CustomFillButton(
                      width: context.width * 0.2,
                      text: 'Follow',
                      onPressed: () {},
                    ),
                  ],
                ).paddingSymmetric(horizontal: 32, vertical: 4),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ).paddingSymmetric(horizontal: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.myDarkBlue,
                    size: 32,
                  ),
                  Text(
                    controller.companyProfile.totalRate.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 27,
                    child: VerticalDivider(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    controller.companyProfile.reviewCount.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Text(
                    'Reviews',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingBar(
                    initialRating: controller.companyProfile.totalRate,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star_rate_rounded,
                          color: AppColors.myDarkBlue),
                      half: const Icon(Icons.star_rate_rounded,
                          color: AppColors.myDarkBlue),
                      empty: Icon(Icons.star_border_rounded,
                          color: Colors.grey.shade300),
                    ),
                    onRatingUpdate: (value) {},
                    ignoreGestures: true,
                    // starOffColor: Colors.white,
                  ),
                ],
              ).onTap(() {
                Get.bottomSheet(
                  BottomSheet(
                    onClosing: () {},
                    builder: (context) => Container(
                      color: Colors.white,
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RatingBar(
                            initialRating: controller.rateValue.value,
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star_rate_rounded,
                                  color: AppColors.myDarkBlue),
                              half: const Icon(Icons.star_rate_rounded,
                                  color: AppColors.myDarkBlue),
                              empty: Icon(Icons.star_border_rounded,
                                  color: Colors.grey.shade300),
                            ),
                            onRatingUpdate: (value) {
                              log(value.toString());
                              controller.rateValue.value = value;
                            },
                            // starOffColor: Colors.white,
                          ),
                          CustomFillButton(
                            width: 100,
                            text: 'Rate',
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).paddingSymmetric(horizontal: 16),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ).paddingSymmetric(horizontal: 10),
              const Text(
                'Published Opportunities',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ).paddingOnly(left: 10),
              GetBuilder<JobControllerImp>(
                builder: (controller) => controller.length == 0 &&
                        controller.statusRequest != StatusRequest.loading
                    ? SizedBox(
                        height: context.height / 1.5,
                        child: const Text('not found any opportunity').center(),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: controller.length,
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
                            () => Get.toNamed(AppRoutes.jobDetailsPage),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ).paddingSymmetric(horizontal: 10, vertical: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
