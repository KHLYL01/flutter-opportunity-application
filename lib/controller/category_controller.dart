import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';

import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';
import '../data/data_sources/remote/category_data.dart';
import '../data/model/job_category_model.dart';

abstract class JobCategoryController extends GetxController {
  toUpdateData(JobCategoryModel model);
  getAllData();
  postDate();
  updateDate();
  deleteDate(int id);
  getJobCategoryName();
  getJobCategoryId(String value);
}

class JobCategoryControllerImp extends JobCategoryController {
  late GlobalKey<FormState> formState;
  late TextEditingController name;

  List<JobCategoryModel> categories = [];

  int get length => categories.length;

  CategoryData categoryData = CategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  int idForUpdate = 0;

  @override
  toUpdateData(JobCategoryModel model) {
    idForUpdate = model.id;
    name.text = model.name;
    Get.toNamed(AppRoutes.updateCategoryPage);
  }

  @override
  getAllData() async {
    _crudDate(await categoryData.getAllDate(), CrudStatus.get);
  }

  @override
  postDate() async {
    if (formState.currentState!.validate()) {
      await _crudDate(
          await categoryData.postDate(name: name.text), CrudStatus.post);
    }
  }

  @override
  updateDate() async {
    if (formState.currentState!.validate()) {
      _crudDate(await categoryData.updateDate(id: idForUpdate, name: name.text),
          CrudStatus.update);
    }
  }

  @override
  deleteDate(int id) async {
    alertDialog(
      title: 'Warning',
      middleText: 'do you want delete this category',
      onPressedConfirm: () async =>
          _crudDate(await categoryData.deleteDate(id: id), CrudStatus.delete),
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
            categories = JobCategoryModel.map(response);
            customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post || CrudStatus.update || CrudStatus.delete:
          {
            Get.back();
            name.clear();
            await getAllData();
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
    name = TextEditingController();

    getAllData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  getJobCategoryName() {
    List<String> list = [];
    for (JobCategoryModel categoryModel in categories) {
      list.add(categoryModel.name);
    }
    log('main Category: $list');
    return list;
  }

  @override
  getJobCategoryId(String value) {
    for (JobCategoryModel categoryModel in categories) {
      if (categoryModel.name == value) {
        return categoryModel.id;
      }
    }
  }
}
