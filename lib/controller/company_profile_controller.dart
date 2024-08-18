import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:opportunity_app/data/model/company_profile_model.dart';

import '../core/enums/status_request.dart';
import '../core/functions/custom_snack_bar.dart';
import '../core/functions/handling_data.dart';
import '../data/data_sources/remote/company_profile_data.dart';

abstract class CompanyProfileController extends GetxController {
  toUpdateProfile();
  getCompanyProfile();
  updateCompanyProfile();
}

class CompanyProfileControllerImp extends CompanyProfileController {
  late TextEditingController scope;

  CompanyProfileModel companyProfile = CompanyProfileModel.zero();

  CompanyProfileData companyProfileData = CompanyProfileData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  RxDouble rateValue = 0.0.obs;

  @override
  toUpdateProfile() {
    scope.text = companyProfile.scope ?? '';
    Get.toNamed(AppRoutes.companyUpdateProfilePage);
  }

  @override
  getCompanyProfile({int? id}) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await companyProfileData.getDataById(
      id: id ?? myServices.getInt(AppKeys.profileId),
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      companyProfile = CompanyProfileModel.fromJson(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  updateCompanyProfile() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await companyProfileData.postDate(
      userId: myServices.getInt(AppKeys.id),
      scope: scope.text,
      imagePath: Get.find<ImageController>().selectedImagePath.value,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.back();
      getCompanyProfile();
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  void onInit() {
    scope = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    scope.dispose();
    super.dispose();
  }
}
