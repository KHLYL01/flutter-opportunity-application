import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/data/data_sources/remote/sub_category_data.dart';
import 'package:opportunity_app/data/model/job_sub_category_model.dart';

import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';

abstract class JobSubCategoryController extends GetxController {
  toUpdateData(JobSubCategoryModel model);
  getAllData();
  getAllDataByCategoryId();
  getAllDataByCategoryIdForDropDown(int id);
  postDate(int jobCategoryId);
  updateDate(int jobCategoryId);
  deleteDate(int id);
  getJobSubCategoryName();
  getJobSubCategoryId(String value);
}

class JobSubCategoryControllerImp extends JobSubCategoryController {
  late GlobalKey<FormState> formState;
  late TextEditingController name;

  List<JobSubCategoryModel> subCategories = [];

  int get length => subCategories.length;

  SubCategoryData subCategoryData = SubCategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  int idForUpdate = 0;

  @override
  toUpdateData(JobSubCategoryModel model) {
    idForUpdate = model.id;
    name.text = model.name;
  }

  @override
  getAllDataByCategoryId() async {
    _crudDate(
      await subCategoryData.getAllDateByCategoryId(id: Get.arguments[0]),
      CrudStatus.get,
    );
  }

  @override
  getAllDataByCategoryIdForDropDown(int id) async {
    _crudDate(
      await subCategoryData.getAllDateByCategoryId(id: id),
      CrudStatus.get,
    );
  }

  @override
  getAllData() async {
    _crudDate(await subCategoryData.getAllDate(), CrudStatus.get);
  }

  @override
  postDate(int jobCategoryId) async {
    if (formState.currentState!.validate()) {
      await _crudDate(
          await subCategoryData.postDate(
            name: name.text,
            jobCategoryId: jobCategoryId,
          ),
          CrudStatus.post);
    }
  }

  @override
  updateDate(int jobCategoryId) async {
    if (formState.currentState!.validate()) {
      _crudDate(
          await subCategoryData.updateDate(
            id: idForUpdate,
            name: name.text,
            jobCategoryId: jobCategoryId,
          ),
          CrudStatus.update);
    }
  }

  @override
  deleteDate(int id) async {
    alertDialog(
      title: 'Warning',
      middleText: 'do you want delete this category',
      onPressedConfirm: () async => _crudDate(
          await subCategoryData.deleteDate(id: id), CrudStatus.delete),
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
            subCategories = JobSubCategoryModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post || CrudStatus.update || CrudStatus.delete:
          {
            Get.back();
            name.clear();
            await getAllDataByCategoryId();
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

    getAllDataByCategoryId();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  getJobSubCategoryName() {
    List<String> list = [];
    for (JobSubCategoryModel categoryModel in subCategories) {
      list.add(categoryModel.name);
    }
    return list;
  }

  @override
  getJobSubCategoryId(String value) {
    for (JobSubCategoryModel categoryModel in subCategories) {
      if (categoryModel.name == value) {
        return categoryModel.id;
      }
    }
  }
}
