import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/free_category_controller.dart';
import 'package:opportunity_app/controller/home_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/controller/sub_category_controller.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/core/services/services.dart';

import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';
import '../data/data_sources/remote/job_data.dart';
import '../data/model/job_model.dart';

abstract class JobController extends GetxController {
  toUpdateData(JobModel model);
  getAllData();
  getDataById(int id);
  getAllDataByCompanyUserId();
  postDate();
  updateDate();
  deleteDate(int id);
}

class JobControllerImp extends JobController {
  late GlobalKey<FormState> formState;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController age;
  late TextEditingController location;
  late DateTime expiryDate;

  List<JobModel> jobs = [];

  JobModel jobModel = JobModel.zero();

  int get length => jobs.length;

  JobData jobData = JobData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  int idForUpdate = 0;

  @override
  toUpdateData(JobModel model) {
    idForUpdate = model.id;
    title.text = model.title;
    description.text = model.description;
    age.text = model.age.toString();
    location.text = model.location;
    //ToDo Get.toNamed(AppRoutes.updateFreeCategoryPage);
  }

  @override
  getAllData() async {
    _crudDate(await jobData.getAllData(), CrudStatus.get);
  }

  @override
  getDataById(int id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await jobData.getDataById(
      id: id,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      jobModel = JobModel.fromJson(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  getAllDataByCompanyUserId({int? id}) async {
    _crudDate(
      await jobData.getAllDateByCompanyProfileId(
        id ?? myServices.getInt(AppKeys.profileId),
      ),
      CrudStatus.get,
    );
  }

  @override
  postDate() async {
    log('hi');
    if (formState.currentState!.validate()) {
      await _crudDate(
          await jobData.postDate(
            title: title.text,
            description: description.text,
            age: int.parse(age.text),
            location: location.text,
            nationality: Get.find<DropDownController>(tag: 'Nationality')
                .currentSelected
                .value,
            gender: Get.find<DropDownController>(tag: 'Gender')
                .currentSelected
                .value,
            jopType: Get.find<DropDownController>(tag: 'Job Type')
                .currentSelected
                .value,
            experience: Get.find<DropDownController>(tag: 'Experience')
                .currentSelected
                .value,
            online: Get.find<DropDownController>(tag: 'Online')
                .currentSelected
                .value,
            expiryDate: expiryDate.toIso8601String(),
            companyProfileId: myServices.getInt(AppKeys.profileId),
            jobSubCategoryId:
                Get.find<JobSubCategoryControllerImp>().getJobSubCategoryId(
              Get.find<DropDownController>(tag: 'Sub Category')
                  .currentSelected
                  .value,
            ),
          ),
          CrudStatus.post);
    }
  }

  @override
  updateDate() async {
    if (formState.currentState!.validate()) {
      _crudDate(
          await jobData.updateDate(
            id: idForUpdate,
            title: title.text,
            description: description.text,
            age: int.parse(age.text),
            location: location.text,
            nationality: '',
            gender: '',
            jopType: '',
            experience: '',
            online: '',
            expiryDate: '',
            companyProfileId: myServices.getInt(AppKeys.profileId),
            jobSubCategoryId: Get.find<FreeCategoryControllerImp>()
                .getFreeCategoryId(
                    Get.find<DropDownController>(tag: 'Free Category')
                        .currentSelected
                        .value),
            // freeCategoryId,
          ),
          CrudStatus.update);
    }
  }

  @override
  deleteDate(int id) async {
    alertDialog(
      title: 'Warning',
      middleText: 'do you want delete this category',
      onPressedConfirm: () async =>
          _crudDate(await jobData.deleteDate(id: id), CrudStatus.delete),
    );
  }

  _crudDate(var response, CrudStatus status) async {
    statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      switch (status) {
        case CrudStatus.get:
          {
            jobs = JobModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post || CrudStatus.update || CrudStatus.delete:
          {
            Get.back();
            title.clear();
            description.clear();
            age.clear();
            location.clear();
            expiryDate = DateTime.now().add(const Duration(days: 7));
            await Get.find<HomeControllerImp>().getAllJobs();
            await getAllDataByCompanyUserId();
          }
      }
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    title = TextEditingController();
    description = TextEditingController();
    age = TextEditingController();
    location = TextEditingController();
    expiryDate = DateTime.now().add(const Duration(days: 7));
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    age.dispose();
    location.dispose();
    super.dispose();
  }
}
