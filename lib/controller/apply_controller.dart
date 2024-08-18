import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:opportunity_app/data/data_sources/remote/apply_data.dart';
import 'package:opportunity_app/data/model/apply_model.dart';

import '../core/constants/app_keys.dart';
import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';

abstract class ApplyController extends GetxController {
  getAllData();
  getAllDataByUserProfileId();
  getAllDataByCompanyProfileId();
  getAllDataByStatus();
  postDate(int jobId);
  updateDate(int id, String status);
  deleteDate(int id);
}

class ApplyControllerImp extends ApplyController {
  List<ApplyModel> applies = [];

  int get length => applies.length;

  ApplyData applyData = ApplyData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  getAllData() async {
    _crudDate(await applyData.getAllDate(), CrudStatus.get);
  }

  @override
  getAllDataByUserProfileId() async {
    _crudDate(
      await applyData.getAllDateByUserProfileId(
        myServices.getInt(AppKeys.profileId),
      ),
      CrudStatus.get,
    );
  }

  @override
  getAllDataByCompanyProfileId() async {
    _crudDate(
      await applyData.getAllDateByCompanyProfileId(
        myServices.getInt(AppKeys.profileId),
      ),
      CrudStatus.get,
    );
  }

  @override
  getAllDataByStatus() async {
    _crudDate(await applyData.getAllDate(), CrudStatus.get);
  }

  @override
  postDate(int jobId) async {
    await _crudDate(
      await applyData.postDate(
        userProfileId: myServices.getInt(AppKeys.profileId),
        jobId: jobId,
      ),
      CrudStatus.post,
    );
  }

  @override
  updateDate(int id, String status) async {
    _crudDate(
        await applyData.updateDate(id: id, status: status), CrudStatus.update);
  }

  @override
  deleteDate(int id) async {
    alertDialog(
      title: 'Warning',
      middleText: 'do you want delete this category',
      onPressedConfirm: () async =>
          _crudDate(await applyData.deleteDate(id: id), CrudStatus.delete),
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
            applies = ApplyModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post:
          {
            Get.back();
            await getAllDataByUserProfileId();
          }
        case CrudStatus.update:
          {
            await getAllDataByCompanyProfileId();
          }
        case CrudStatus.delete:
          {}
      }
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  getColor(String status) {
    if (status == 'REQUESTING') {
      return Colors.orange;
    }
    if (status == 'ACCEPTABLE') {
      return Colors.green;
    }
    if (status == 'UNACCEPTABLE') {
      return Colors.red;
    }
  }

  checkIsFound(int id) {
    for (ApplyModel applyModel in applies) {
      if (applyModel.jobId == id) {
        return applyModel.status;
      }
    }
    return null;
  }
}
