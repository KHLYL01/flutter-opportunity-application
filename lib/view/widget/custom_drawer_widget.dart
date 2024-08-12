import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';

import '../../core/constants/app_colors.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.black,
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
                  size: 128,
                ),
              ],
            ),
          ),
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
          const Divider(
            color: Colors.black,
            thickness: 0.1,
          ),
          ListTile(
            onTap: () {
              Scaffold.of(context).closeDrawer();
            },
            title: Text("Logout"),
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
