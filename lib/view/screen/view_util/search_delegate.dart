import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:opportunity_app/controller/company_profile_controller.dart';
import 'package:opportunity_app/controller/home_controller.dart';
import 'package:opportunity_app/controller/job_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/fill_button.dart';
import 'package:opportunity_app/view/widget/job_card.dart';

import '../../../controller/rate_controller.dart';
import '../../../core/class/view_handle.dart';
import '../../../link_api.dart';
import '../../widget/drop_down.dart';

class MySearchDelegate extends SearchDelegate {
  HomeControllerImp controller = Get.find();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
            // Get.to(SplashPage());
          } else {
            query = '';
          }
        },
      ),
      TextButton(
        onPressed: () {
          Get.bottomSheet(
            BottomSheet(
              onClosing: () {},
              builder: (context) => Container(
                color: Colors.white,
                height: double.infinity,
                child: ListView(
                  children: [
                    const CustomDropDown(title: 'Search Gender'),
                    const CustomDropDown(title: 'Search Nationality'),
                    const CustomDropDown(title: 'Search Job Type'),
                    const CustomDropDown(title: 'Search Experience'),
                    const CustomDropDown(title: 'Search Online'),
                    const CustomDropDown(title: 'Search Category'),
                    CustomFillButton(
                      width: double.infinity,
                      text: 'Add',
                      onPressed: () {
                        Get.back();
                      },
                    ).paddingOnly(top: 8)
                  ],
                ).paddingAll(16),
              ),
            ),
          );
        },
        child: const Text('Add Filter'),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      controller.jobSearch(query);
    });

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => ViewHandle(
        statusRequest: controller.statusRequest,
        widget: controller.searchJobs.isEmpty
            ? Column(
                children: [
                  getFilter(),
                  Container(child: const Text('Not Found Any Job').center())
                      .expanded(flex: 1),
                ],
              )
            : ListView(
                children: [
                  getFilter(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.searchJobs.length,
                    itemBuilder: (context, index) {
                      var item = controller.searchJobs[index];
                      return ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          ListTile(
                            onTap: () {
                              Get.find<RateControllerImp>()
                                  .getAllDataByCompanyProfileId();
                              Get.toNamed(AppRoutes.viewCompanyProfilePage);
                              Get.find<CompanyProfileControllerImp>()
                                  .getCompanyProfile(id: item.companyId);
                            },
                            dense: true,
                            title: Text(
                              item.companyName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              item.companyScope == null
                                  ? '...'
                                  : item.companyScope!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.blue,
                              backgroundImage: item.companyImageUrl != null
                                  ? NetworkImage(
                                      '${AppLink.images}/image/${item.companyImageUrl!}',
                                    )
                                  : null,
                              child: item.companyImageUrl == null
                                  ? Text(
                                      item.companyName == ''
                                          ? ' '
                                          : item.companyName[0],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  : null,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          JobCard(
                            name: item.title,
                            description: item.description,
                            location: item.location,
                            expiryDate: item.expiryDate,
                            jobType: item.jopType,
                            online: item.online,
                          ).onTap(() {
                            Get.find<JobControllerImp>().getDataById(item.id);
                            Get.toNamed(AppRoutes.jobDetailsPage);
                          }).paddingSymmetric(horizontal: 8),
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 8);
                    },
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  getFilter() {
    return Container(
      color: Colors.white,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (Get.find<DropDownController>(tag: 'Search Category')
                  .currentSelected
                  .value !=
              '...')
            Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      Get.find<DropDownController>(tag: 'Search Category')
                          .currentSelected
                          .value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ).center().paddingSymmetric(vertical: 4, horizontal: 8))
                .paddingSymmetric(horizontal: 4),
          if (Get.find<DropDownController>(tag: 'Search Gender')
                  .currentSelected
                  .value !=
              '...')
            Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      Get.find<DropDownController>(tag: 'Search Gender')
                          .currentSelected
                          .value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ).center().paddingSymmetric(vertical: 4, horizontal: 8))
                .paddingSymmetric(horizontal: 4),
          if (Get.find<DropDownController>(tag: 'Search Job Type')
                  .currentSelected
                  .value !=
              '...')
            Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      Get.find<DropDownController>(tag: 'Search Job Type')
                          .currentSelected
                          .value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ).center().paddingSymmetric(vertical: 4, horizontal: 8))
                .paddingSymmetric(horizontal: 4),
          if (Get.find<DropDownController>(tag: 'Search Experience')
                  .currentSelected
                  .value !=
              '...')
            Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      Get.find<DropDownController>(tag: 'Search Experience')
                          .currentSelected
                          .value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ).center().paddingSymmetric(vertical: 4, horizontal: 8))
                .paddingSymmetric(horizontal: 4),
          if (Get.find<DropDownController>(tag: 'Search Online')
                  .currentSelected
                  .value !=
              '...')
            Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      Get.find<DropDownController>(tag: 'Search Online')
                          .currentSelected
                          .value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ).center().paddingSymmetric(vertical: 4, horizontal: 8))
                .paddingSymmetric(horizontal: 4),
          if (Get.find<DropDownController>(tag: 'Search Nationality')
                  .currentSelected
                  .value !=
              '...')
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                Get.find<DropDownController>(tag: 'Search Nationality')
                    .currentSelected
                    .value,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ).center().paddingSymmetric(vertical: 4, horizontal: 8),
            )
        ],
      ),
    );
  }
}
