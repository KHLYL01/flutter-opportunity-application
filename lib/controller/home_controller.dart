import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/data/data_sources/remote/auth_data.dart';
import 'package:opportunity_app/data/data_sources/remote/company_profile_data.dart';
import 'package:opportunity_app/data/data_sources/remote/job_data.dart';
import 'package:opportunity_app/data/data_sources/remote/user_profile_data.dart';
import 'package:opportunity_app/data/model/company_profile_model.dart';
import 'package:opportunity_app/data/model/job_model.dart';
import 'package:opportunity_app/data/model/user_model.dart';
import 'package:opportunity_app/data/model/user_profile_model.dart';

import '../core/functions/custom_snack_bar.dart';
import '../core/functions/handling_data.dart';

abstract class HomeController extends GetxController {
  getAllUserProfiles();
  getAllCompanyProfiles();
  getAllCompanyRequest();
  updateCompanyRequest(int id);
  deleteCompanyRequest(int id);
  getAllJobs();
  jobSearch(String query);
}

class HomeControllerImp extends HomeController {
  late GlobalKey<ScaffoldState> scaffoldState;

  List<UserProfileModel> userProfiles = [];
  List<CompanyProfileModel> companyProfiles = [];
  List<JobModel> jobs = [];

  List<JobModel> searchJobs = [];

  List<UserModel> companyRequest = [];

  UserProfileData userProfileData = UserProfileData(Get.find());
  CompanyProfileData companyProfileData = CompanyProfileData(Get.find());
  JobData jobData = JobData(Get.find());
  AuthData authData = AuthData(Get.find());
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
  getAllCompanyRequest() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await authData.userData();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      companyRequest = UserModel.map(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  updateCompanyRequest(int id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await authData.updateUserData(id);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getAllCompanyRequest();
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  deleteCompanyRequest(int id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await authData.deleteUserData(id);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getAllCompanyRequest();
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  jobSearch(String query) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await jobData.search(
      title: query,
      gender: Get.find<DropDownController>(tag: 'Search Gender')
          .currentSelected
          .value,
      nationality: Get.find<DropDownController>(tag: 'Search Nationality')
          .currentSelected
          .value,
      jopType: Get.find<DropDownController>(tag: 'Search Job Type')
          .currentSelected
          .value,
      experience: Get.find<DropDownController>(tag: 'Search Experience')
          .currentSelected
          .value,
      online: Get.find<DropDownController>(tag: 'Search Online')
          .currentSelected
          .value,
      jobCategoryName: Get.find<DropDownController>(tag: 'Search Category')
          .currentSelected
          .value,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      searchJobs = JobModel.map(response);
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
