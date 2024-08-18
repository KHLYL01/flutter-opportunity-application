import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/alert_dialog.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/data/data_sources/remote/free_category_data.dart';

import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';
import '../data/model/free_category_model.dart';

abstract class FreeCategoryController extends GetxController {
  toUpdateData(FreeCategoryModel model);
  getAllData();
  postDate();
  updateDate();
  deleteDate(int id);
  getFreeCategoryName();
  getFreeCategoryId(String value);
}

class FreeCategoryControllerImp extends FreeCategoryController {
  late GlobalKey<FormState> formState;
  late TextEditingController name;

  List<FreeCategoryModel> freeCategories = [];

  int get length => freeCategories.length;

  FreeCategoryData freeCategoryData = FreeCategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  int idForUpdate = 0;

  @override
  toUpdateData(FreeCategoryModel model) {
    idForUpdate = model.id;
    name.text = model.name;
    Get.toNamed(AppRoutes.updateFreeCategoryPage);
  }

  @override
  getAllData() async {
    _crudDate(await freeCategoryData.getAllDate(), CrudStatus.get);
  }

  @override
  postDate() async {
    log('hi');
    if (formState.currentState!.validate()) {
      await _crudDate(
          await freeCategoryData.postDate(name: name.text), CrudStatus.post);
    }
  }

  @override
  updateDate() async {
    if (formState.currentState!.validate()) {
      _crudDate(
          await freeCategoryData.updateDate(id: idForUpdate, name: name.text),
          CrudStatus.update);
    }
  }

  @override
  deleteDate(int id) async {
    alertDialog(
      title: 'Warning',
      middleText: 'do you want delete this category',
      onPressedConfirm: () async => _crudDate(
          await freeCategoryData.deleteDate(id: id), CrudStatus.delete),
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
            freeCategories = FreeCategoryModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
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
  void onInit() async {
    formState = GlobalKey<FormState>();
    name = TextEditingController();

    await getAllData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  getFreeCategoryName() {
    List<String> list = [];
    for (FreeCategoryModel categoryModel in freeCategories) {
      list.add(categoryModel.name);
    }
    return list;
  }

  @override
  getFreeCategoryId(String value) {
    for (FreeCategoryModel categoryModel in freeCategories) {
      if (categoryModel.name == value) {
        return categoryModel.id;
      }
    }
  }
}
