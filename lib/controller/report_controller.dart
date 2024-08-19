import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:opportunity_app/data/data_sources/remote/report_data.dart';
import 'package:opportunity_app/data/model/report_model.dart';

import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';

abstract class ReportController extends GetxController {
  getAllData();
  getAllDataByUserProfileId();
  getAllDataByCompanyProfileId(int id);
  postDate(int companyProfileId);
  deleteDate(int id);
}

class ReportControllerImp extends ReportController {
  late GlobalKey<FormState> formState;
  late TextEditingController cause;
  late TextEditingController details;

  List<ReportModel> reports = [];

  int get length => reports.length;

  ReportData reportData = ReportData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  getAllData() async {
    _crudDate(await reportData.getAllDate(), CrudStatus.get);
  }

  @override
  getAllDataByUserProfileId() async {
    _crudDate(
        await reportData
            .getAllDateByUserProfileId(myServices.getInt(AppKeys.profileId)),
        CrudStatus.get);
  }

  @override
  getAllDataByCompanyProfileId(int id) async {
    _crudDate(
        await reportData.getAllDateByCompanyProfileId(id), CrudStatus.get);
  }

  @override
  postDate(int companyProfileId) async {
    if (formState.currentState!.validate()) {
      await _crudDate(
        await reportData.postDate(
          companyProfileId: companyProfileId,
          userProfileId: myServices.getInt(AppKeys.profileId),
          cause: cause.text,
          details: details.text,
          imagePath: Get.find<ImageController>().selectedImagePath.value,
        ),
        CrudStatus.post,
      );
    }
  }

  @override
  deleteDate(int id) async {
    alertDialog(
      title: 'Warning',
      middleText: 'do you want delete this category',
      onPressedConfirm: () async =>
          _crudDate(await reportData.deleteDate(id: id), CrudStatus.delete),
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
            reports = ReportModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post || CrudStatus.update || CrudStatus.delete:
          {
            Get.back();
            Get.back();
            cause.clear();
            details.clear();
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
    cause = TextEditingController();
    details = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    cause.dispose();
    details.dispose();
    super.dispose();
  }

  checkIsFound(int companyProfileId) {
    for (ReportModel reportModel in reports) {
      if (reportModel.companyProfileId == companyProfileId) {
        return true;
      }
    }
    return false;
  }

  int getSumOfReport(int companyProfileId) {
    int sum = 0;
    for (ReportModel reportModel in reports) {
      if (reportModel.companyProfileId == companyProfileId) {
        sum++;
      }
    }
    return sum;
  }
}
