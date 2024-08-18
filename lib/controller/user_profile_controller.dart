import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/controller/shared/image_controller.dart';
import 'package:opportunity_app/controller/shared/drop_down_controller.dart';
import 'package:opportunity_app/core/constants/app_keys.dart';
import 'package:opportunity_app/core/constants/app_routes.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:opportunity_app/data/model/user_profile_model.dart';
import 'package:opportunity_app/data/data_sources/remote/user_profile_data.dart';

import '../core/enums/status_request.dart';
import '../core/functions/custom_snack_bar.dart';
import '../core/functions/handling_data.dart';

abstract class UserProfileController extends GetxController {
  selectFile();
  toUpdateProfile();
  getUserProfile();
  updateUserProfile();
}

class UserProfileControllerImp extends UserProfileController {
  File? file;

  late TextEditingController specialize;
  late TextEditingController age;
  late TextEditingController location;

  UserProfileModel userProfile = UserProfileModel.zero();

  UserProfileData userProfileData = UserProfileData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
    }
    update();
  }

  @override
  toUpdateProfile() {
    age.text = userProfile.age == 0 ? '' : userProfile.age.toString();
    Get.find<DropDownController>(tag: 'Gender')
        .currentSelected(userProfile.gender ?? '...');
    Get.find<DropDownController>(tag: 'Educational Level')
        .currentSelected(userProfile.educationalLevel ?? '...');
    Get.find<DropDownController>(tag: 'Nationality')
        .currentSelected(userProfile.nationality ?? '...');
    specialize.text = userProfile.specialty ?? '';
    location.text = userProfile.location ?? '';

    Get.toNamed(AppRoutes.userUpdateProfilePage);
  }

  @override
  getUserProfile({int? id}) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await userProfileData.getDataById(
      id: id ?? myServices.getInt(AppKeys.profileId),
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      userProfile = UserProfileModel.fromJson(response);
      // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  updateUserProfile() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await userProfileData.postDate(
      userId: myServices.getInt(AppKeys.id),
      age: age.text,
      gender: Get.find<DropDownController>(tag: 'Gender').currentSelected.value,
      educationalLevel: Get.find<DropDownController>(tag: 'Educational Level')
          .currentSelected
          .value,
      nationality: Get.find<DropDownController>(tag: 'Nationality')
          .currentSelected
          .value,
      specialty: specialize.text,
      location: location.text,
      imagePath: Get.find<ImageController>().selectedImagePath.value,
      pdfPath: file == null ? '' : file!.path,
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.back();
      getUserProfile();
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    specialize = TextEditingController();
    age = TextEditingController();
    location = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    specialize.dispose();
    age.dispose();
    location.dispose();
    super.dispose();
  }
}
