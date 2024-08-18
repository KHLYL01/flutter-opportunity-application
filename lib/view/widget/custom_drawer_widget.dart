import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:opportunity_app/controller/report_controller.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/services/services.dart';

import '../../core/constants/app_colors.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: AppColors.myDarkBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  MdiIcons.accountCircle,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  '${myServices.getString(AppKeys.name)} (${myServices.getString(AppKeys.role)})',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  myServices.getString(AppKeys.email),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          if (myServices.getString(AppKeys.role) == 'USER')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.userProfilePage);
              },
              title: const Text("My Profile"),
              leading: Icon(
                MdiIcons.account,
              ),
              minLeadingWidth: 10,
            ),
          if (myServices.getString(AppKeys.role) == 'USER')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.userRequestPage);
              },
              title: const Text("My Request"),
              leading: Icon(
                MdiIcons.orderAlphabeticalAscending,
              ),
              minLeadingWidth: 10,
            ),
          if (myServices.getString(AppKeys.role) == 'COMPANY')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.companyProfilePage);
              },
              title: const Text("My company Profile"),
              leading: Icon(
                MdiIcons.account,
              ),
              minLeadingWidth: 10,
            ),
          if (myServices.getString(AppKeys.role) == 'COMPANY')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.companyRequestPage);
              },
              title: const Text("Apply Job"),
              leading: const Icon(
                Icons.bookmark_border_rounded,
              ),
              minLeadingWidth: 10,
            ),
          if (myServices.getString(AppKeys.role) == 'ADMIN')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.reportPage);
                Get.find<ReportControllerImp>().getAllData();
              },
              title: const Text("Reports"),
              leading: const Icon(
                Icons.warning_amber,
              ),
              minLeadingWidth: 10,
            ),
          if (myServices.getString(AppKeys.role) == 'ADMIN')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.categoryPage);
              },
              title: const Text("Job Categories"),
              leading: const Icon(
                Icons.category,
              ),
              minLeadingWidth: 10,
            ),
          if (myServices.getString(AppKeys.role) == 'ADMIN')
            ListTile(
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Get.toNamed(AppRoutes.freeCategoryPage);
              },
              title: const Text("Free Categories"),
              leading: const Icon(
                Icons.category,
              ),
              minLeadingWidth: 10,
            ),
          const Divider(
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              myServices.sharedPreferences.remove('step');
              Get.offAllNamed(AppRoutes.loginPage);
            },
            title: const Text("Logout"),
            leading: Icon(
              MdiIcons.logoutVariant,
            ),
            minLeadingWidth: 10,
          ),
        ],
      ),
    );
  }
}
