import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/home_controller.dart';
import 'package:opportunity_app/controller/report_controller.dart';
import 'package:opportunity_app/core/class/view_handle.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/data/model/company_profile_model.dart';

import '../widget/company_report_card.dart';

class CompanyReportPage extends StatelessWidget {
  const CompanyReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Reports'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => ViewHandle(
          onPressed: () => controller.getAllCompanyProfiles(),
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.companyProfiles.length,
            itemBuilder: (context, index) {
              CompanyProfileModel item = controller.companyProfiles[index];
              return CompanyReportCard(
                companyName: item.name,
                companyScope: item.scope,
                companyImageUrl: item.imageUrl,
                reportCount:
                    Get.find<ReportControllerImp>().getSumOfReport(item.id),
              ).onTap(
                () {
                  Get.toNamed(AppRoutes.reportPage);
                  Get.find<ReportControllerImp>()
                      .getAllDataByCompanyProfileId(item.id);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
