import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/data/data_sources/remote/company_profile_data.dart';
import 'package:opportunity_app/data/data_sources/remote/job_data.dart';
import 'package:opportunity_app/data/data_sources/remote/user_profile_data.dart';
import 'package:opportunity_app/data/model/company_profile_model.dart';
import 'package:opportunity_app/data/model/job_model.dart';
import 'package:opportunity_app/data/model/user_profile_model.dart';

import '../core/functions/custom_snack_bar.dart';
import '../core/functions/handling_data.dart';

abstract class HomeController extends GetxController {
  getAllUserProfiles();
  getAllCompanyProfiles();
  getAllJobs();
}

class HomeControllerImp extends HomeController {
  late GlobalKey<ScaffoldState> scaffoldState;

  List<UserProfileModel> userProfiles = [];
  List<CompanyProfileModel> companyProfiles = [];
  List<JobModel> jobs = [];

  UserProfileData userProfileData = UserProfileData(Get.find());
  CompanyProfileData companyProfileData = CompanyProfileData(Get.find());
  JobData jobData = JobData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  getAllUserProfiles() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await userProfileData.getAllData();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      userProfiles = UserProfileModel.map(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  getAllCompanyProfiles() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await companyProfileData.getAllData();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      companyProfiles = CompanyProfileModel.map(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  getAllJobs() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await jobData.getAllData();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      jobs = JobModel.map(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  void onInit() {
    scaffoldState = GlobalKey<ScaffoldState>();
    getAllJobs();
    getAllCompanyProfiles();
    getAllUserProfiles();
    super.onInit();
  }
}
