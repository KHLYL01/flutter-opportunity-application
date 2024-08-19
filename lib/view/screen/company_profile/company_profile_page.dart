import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/job_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_colors.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../../controller/rate_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/enums/status_request.dart';
import '../../../link_api.dart';
import '../../widget/job_card.dart';
import '../view_util/image_page.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyProfileControllerImp>(
      builder: (controller) => ViewHandle(
        onPressed: () => controller.getCompanyProfile(),
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          appBar: AppBar(
            title: Text('${controller.companyProfile.name} Profile'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => controller.toUpdateProfile(),
                icon: const Icon(
                  Icons.edit,
                  size: 24,
                ),
              ).paddingOnly(right: 5)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(
              AppRoutes.addJobPage,
            ),
            child: const Icon(Icons.add),
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
                leading: CircleAvatar(
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     CustomFillButton(
              //       width: context.width * 0.2,
              //       text: 'Report',
              //       fillColor: AppColors.heavyRed,
              //       onPressed: () {},
              //     ),
              //     const SizedBox(width: 30),
              //     CustomFillButton(
              //       width: context.width * 0.2,
              //       text: 'Follow',
              //       onPressed: () {},
              //     ),
              //   ],
              // ).paddingSymmetric(horizontal: 32, vertical: 4),
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
                  Obx(
                    () => Text(
                      Get.find<RateControllerImp>()
                          .rate
                          .value
                          .toString()
                          .substring(0, 3),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                    child: VerticalDivider(
                      color: Colors.black,
                    ),
                  ),
                  Obx(
                    () => Text(
                      Get.find<RateControllerImp>().review.value.toString(),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const Text(
                    'Reviews',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => RatingBar(
                      initialRating: Get.find<RateControllerImp>().rate.value,
                      allowHalfRating: true,
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
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
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
                            () {
                              Get.find<JobControllerImp>().getDataById(item.id);
                              Get.toNamed(AppRoutes.jobDetailsPage);
                            },
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
