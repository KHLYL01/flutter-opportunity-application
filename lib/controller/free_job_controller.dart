import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/free_category_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:opportunity_app/data/data_sources/remote/free_job_data.dart';
import 'package:opportunity_app/data/model/free_job_model.dart';

import '../core/constants/app_keys.dart';
import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';

abstract class FreeJobController extends GetxController {
  getAllData();
  getAllDataByUserProfileId();
  postDate();
  updateDate();
  deleteDate(int id);
}

class FreeJobControllerImp extends FreeJobController {
  late GlobalKey<FormState> formState;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController url;

  List<FreeJobModel> freeJobs = [];

  int get length => freeJobs.length;

  FreeJobData freeJobData = FreeJobData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  int idForUpdate = 0;

  // @override
  // toUpdateData(FreeCategoryModel model) {
  //   idForUpdate = model.id;
  //   name.text = model.name;
  //   Get.toNamed(AppRoutes.updateFreeCategoryPage);
  // }

  @override
  getAllData() async {
    _crudDate(await freeJobData.getAllDate(), CrudStatus.get);
  }

  @override
  getAllDataByUserProfileId({int? id}) async {
    _crudDate(
      await freeJobData.getAllDateByUserId(
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
          await freeJobData.postDate(
            title: title.text,
            description: description.text,
            url: url.text,
            userProfileId: myServices.getInt(AppKeys.profileId),
            freeCategoryId: Get.find<FreeCategoryControllerImp>()
                .getFreeCategoryId(
                    Get.find<DropDownController>(tag: 'Free Category')
                        .currentSelected
                        .value),
          ),
          CrudStatus.post);
    }
  }

  @override
  updateDate() async {
    if (formState.currentState!.validate()) {
      _crudDate(
          await freeJobData.updateDate(
            id: idForUpdate,
            title: title.text,
            description: description.text,
            url: url.text,
            userProfileId: myServices.getInt(AppKeys.profileId),
            freeCategoryId: 0,
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
          _crudDate(await freeJobData.deleteDate(id: id), CrudStatus.delete),
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
            freeJobs = FreeJobModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post || CrudStatus.update || CrudStatus.delete:
          {
            Get.back();
            title.clear();
            description.clear();
            url.clear();
            await getAllDataByUserProfileId();
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
    url = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    url.dispose();
    super.dispose();
  }
}
